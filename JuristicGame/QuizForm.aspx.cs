using JuristicGame.sql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JuristicGame
{
    using System.Windows.Forms;

    public partial class QuizForm : System.Web.UI.Page
    {
        QuizDataSet.QuestionsDataTable questions;
        QuizDataSet.ChoicesDataTable choices;
        Int32 rightAnswerId;
        int index;
        bool newQuiz;
        //int index = 0;

        const String LINK_TRAGET_HOME = "~/Home.aspx";
        const String PARAM_USERID = "UserName";
        private String _userName = String.Empty;

        private String userName
        {
            get
            {
                if (_userName == String.Empty)
                {
                    _userName = Request.Params[PARAM_USERID];
                }
                return _userName;
            }
            set
            {
                _userName = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            UserBO userBo = new UserBO();
            QuizBO quizBo = new QuizBO();

            QuizDataSet.UsersRow userRow = userBo.GetUserByName(userName);
            if (userRow != null)
            {
                SetAdminMode(userRow.RoleId);
                SetNewMode(userRow.RoleId);
            }

            if (!newQuiz)
            {
                // get questions and randomize
                List<Int32> ids = RandomQuestionGenerator();
                //String idString = RandomQuestionGenerator();
                questions = quizBo.GetQestions(ids);
            }
        }

        protected void btnStart_Click(Object sender, EventArgs e)
        {
            newQuiz = false;
            btnStart.Enabled = false;
            btnStart.Visible = false;
            btnCheck.Visible = true;
            txtQuestion.Visible = true;
            rblAnswers.Visible = true;
            tcRblAnswers.Visible = true;

            FillQuiz();
        }

        protected void btnNewQuestion_Click(Object sender, EventArgs e)
        {
            QuizBO quizBo = new QuizBO();
            bool savingQuestionSuccess = false;
            String question = txtQuestion.Text;
            String answer = txtAnswer1.Text;
            String choice1 = txtAnswer2.Text;
            String choice2 = txtAnswer3.Text;

            // save question
            savingQuestionSuccess = quizBo.CreateNewQuestion(question, answer, choice1, choice2);
            if (!savingQuestionSuccess)
            {
                // error happened
                MessageBox.Show("Fragen konnten nicht gespeichert werden");
            }
        }

        protected void btnCheck_Click(Object sender, EventArgs e)
        {
            bool rightAnswer = false;
            // hint loeschen

            if (index != 0)
            {
                if (rblAnswers.SelectedItem.Value == rightAnswerId.ToString())
                {
                    rightAnswer = true;
                    // hint correct answer
                }
            }

            if (index == 0 || index < questions.Count && rightAnswer)
            {
                //next question
                FillQuiz();
                index++;
            }
            else if (index > questions.Count)
            {
                // hint end of game
                // get new question and reset index
            }
            else
            {
                // hint wrong choice
            }
        }

        protected void SetAdminMode(int roleId)
        {
            bool isAdmin = false;
            isAdmin = (roleId == (Int32) EnumRoleNames.ADMIN);

            chkNewQuestion.Visible = isAdmin;
            lblNewQuestion.Visible = isAdmin;
            chkNewQuestion.Enabled = isAdmin;
        }

        protected void SetNewMode(int roleId)
        {
            bool editMode = false;
            if (roleId == (Int32) EnumRoleNames.ADMIN)
            {
                editMode = chkNewQuestion.Checked;
            }

            txtQuestion.Enabled = editMode;
            validtxtQuestion.Enabled = editMode;
            trAnswers.Visible = editMode;
            txtAnswer1.Enabled = editMode;
            validtxtAnswer1.Enabled = editMode;
            txtAnswer2.Enabled = editMode;
            validtxtAnswer2.Enabled = editMode;
            txtAnswer3.Enabled = editMode;
            validtxtAnswer3.Enabled = editMode;
            btnNewQuestion.Visible = editMode;
            rblAnswers.Enabled = !editMode;
            rblAnswers.Visible = !editMode;
            btnCheck.Enabled = !editMode;
        }

        public List<Int32> RandomQuestionGenerator()
        {
            QuizBO quizBo = new QuizBO();
            QuizDataSet.QuestionsDataTable questions = quizBo.GetAllQestions();

            Random r = new Random();
            var rowsTaken = new HashSet<int>();
            DataTable randomTable = new DataTable();
            randomTable = questions.Clone();
            for (int i = 0; i < 5; i++)
            {
                int randomIndex = r.Next(questions.Rows.Count);
                if (!rowsTaken.Add(randomIndex))
                {
                    randomIndex = r.Next(questions.Rows.Count);
                }
                DataRow randomRow = questions.Rows[randomIndex];
                randomTable.ImportRow(randomRow);
            }

            QuizDataSet.QuestionsDataTable randomQuestions = (QuizDataSet.QuestionsDataTable)randomTable;
            string questionIdString = String.Empty;

            List<Int32> questionIds = new List<int>(5);
            foreach (QuizDataSet.QuestionsRow randomRow in randomQuestions)
            {
                questionIds.Add(randomRow.QuestionId);
            }

            return questionIds;
            //questionIdString = String.Join(",", questionIds);

            //return questionIdString;
        }

        public List<int> RandomOrder()
        {
            Random r = new Random();
            List<int> indexOrder = new List<int>();
            for (int i = 0; i < choices.Count; i++)
            {
                int randomIndex = r.Next(choices.Count);
                indexOrder.Add(randomIndex);
            }
            
            return indexOrder;
        }

        public void FillQuiz()
        {
            QuizBO quizBo = new QuizBO();

            int i = questions[index].QuestionId;

            rightAnswerId = quizBo.GetAnswerIdByQuestionId(questions[index].QuestionId);
            choices = quizBo.GetChoicesByQuestionId(questions[index].QuestionId);

            txtQuestion.Text = questions[index].QuestionTextKey;
            List<int> order = RandomOrder();
            
            rblAnswers.Items[0].Text = choices[order[0]].ChoiceTextKey;
            rblAnswers.Items[0].Value = choices[order[0]].ChoiceId.ToString();
            rblAnswers.Items[1].Text = choices[order[1]].ChoiceTextKey;
            rblAnswers.Items[1].Value = choices[order[1]].ChoiceId.ToString();
            rblAnswers.Items[2].Text = choices[order[2]].ChoiceTextKey;
            rblAnswers.Items[2].Value = choices[order[2]].ChoiceId.ToString();
        }

        public void RestartGame()
        {
            questions = new QuizDataSet.QuestionsDataTable();
            choices = new QuizDataSet.ChoicesDataTable();
            rightAnswerId = 0;
            index = 0;
            newQuiz = true;
            //Page_Load();
        }

        protected void btnHomeQuiz_Click(object sender, EventArgs e)
        {
            Response.Redirect(LINK_TRAGET_HOME + "?" + PARAM_USERID + "=" + userName, false);
        }
    }
}