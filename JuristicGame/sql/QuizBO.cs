using JuristicGame.sql.QuizDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace JuristicGame.sql
{
    [DataObject]
    public class QuizBO : BusinessObject
    {
        private QuizTableAdapter _quizAdapter;
        private QuestionsTableAdapter _questionsAdapter;
        private AnswersTableAdapter _answersTableAdapter;
        private ChoicesTableAdapter _choicesAdapter;
        private LearningTableAdapter _learningAdapter;

        protected QuizTableAdapter quizDataAdapter
        {
            get
            {
                if (null == _questionsAdapter)
                {
                    _quizAdapter = new QuizTableAdapter();
                    _quizAdapter.Connection.ConnectionString = connectionString + "App=QuizBO";
                }
                return _quizAdapter;
            }
        }

        protected QuestionsTableAdapter questionsDataAdapter
        {
            get
            {
                if (null == _questionsAdapter)
                {
                    _questionsAdapter = new QuestionsTableAdapter();
                    _questionsAdapter.Connection.ConnectionString = connectionString + "App=QuizBO";
                }
                return _questionsAdapter;
            }
        }

        protected AnswersTableAdapter answersDataAdapter
        {
            get
            {
                if (null == _answersTableAdapter)
                {
                    _answersTableAdapter = new AnswersTableAdapter();
                    _answersTableAdapter.Connection.ConnectionString = connectionString + "App=QuizBO";
                }
                return _answersTableAdapter;
            }
        }

        protected ChoicesTableAdapter choicesDataAdapter
        {
            get
            {
                if (null == _choicesAdapter)
                {
                    _choicesAdapter = new ChoicesTableAdapter();
                    _choicesAdapter.Connection.ConnectionString = connectionString + "App=QuizBO";
                }
                return _choicesAdapter;
            }
        }

        protected LearningTableAdapter learningDataAdapter
        {
            get
            {
                if (null == _learningAdapter)
                {
                    _learningAdapter = new LearningTableAdapter();
                    _learningAdapter.Connection.ConnectionString = connectionString + "App=QuizBO";
                }
                return _learningAdapter;
            }
        }

        public QuizBO()
        {
            quizDataAdapter.Connection.Open();
            questionsDataAdapter.Connection.Open();
            answersDataAdapter.Connection.Open();
            choicesDataAdapter.Connection.Open();
            learningDataAdapter.Connection.Open();
        }

        // stored procedure
        static String spAddQuestion = @"dbo.[AddQuestion]";
        public const String QuizName = "E-Contracting";

        public bool AddQuestionToECommerce(string question, string answer, string choice1, string choice2)
        {
            // SqlCommand
            SqlCommand cmd = new SqlCommand(spAddQuestion, GetConnection());

            // set parameter
            SqlParameter paramQuestion = new SqlParameter("@Question", SqlDbType.NVarChar);
            SqlParameter paramQuiz = new SqlParameter("@Quiz", SqlDbType.NVarChar, 80);
            SqlParameter paramRightChoice = new SqlParameter("@RightChoice", SqlDbType.NVarChar);
            SqlParameter paramWrongChoice1 = new SqlParameter("@WrongChoice1", SqlDbType.NVarChar);
            SqlParameter paramWrongChoice2 = new SqlParameter("@WrongChoice2", SqlDbType.NVarChar);

            paramQuestion.Value = question;
            paramQuiz.Value = QuizName;
            paramRightChoice.Value = answer;
            paramWrongChoice1.Value = choice1;
            paramWrongChoice2.Value = choice2;

            //add parameter to SqlCommand
            cmd.Parameters.Add(paramQuestion);
            cmd.Parameters.Add(paramQuiz);
            cmd.Parameters.Add(paramRightChoice);
            cmd.Parameters.Add(paramWrongChoice1);
            cmd.Parameters.Add(paramWrongChoice2);

            return ExecuteStoredProcedure(cmd);
        }

        public Boolean CreateNewQuestion(String question, String answer, String choice1, String choice2)
        {
            Boolean addQuestionSuccessful = false;

            try
            {
                addQuestionSuccessful = AddQuestionToECommerce(question, answer, choice1, choice2);
            }
            catch
            {
                // log exception
            }
            return addQuestionSuccessful;
        }

        public QuizDataSet.QuestionsDataTable GetAllQestions()
        {
            QuizDataSet.QuestionsDataTable questions = questionsDataAdapter.GetPossibleQuestions();

            if (questions.Count == 0)
            {
                return null;
            }
            return questions;
        }

        public QuizDataSet.QuestionsDataTable GetQestions(List<Int32> ids)
        {
            DataTable questions = new QuizDataSet.QuestionsDataTable();
            
            foreach (int id in ids)
            {
                questions.ImportRow(questionsDataAdapter.GetDataByQuestionId(id)[0]);
            }
            
            return (QuizDataSet.QuestionsDataTable) questions;
        }

        public Int32 GetAnswerIdByQuestionId(int questionId)
        {
            QuizDataSet.AnswersDataTable answers = answersDataAdapter.GetDataByQuestionId(questionId);

            if (answers.Count == 0)
            {
                return 0;
            }
            return answers[0].ChoiceId;
        }

        public QuizDataSet.ChoicesDataTable GetChoicesByQuestionId(int questionId)
        {
            QuizDataSet.ChoicesDataTable choices = choicesDataAdapter.GetDataByQuestionId(questionId);

            if (choices.Count == 0)
            {
                return null;
            }
            return choices;
        }

        public QuizDataSet.LearningDataTable GetLearning()
        {
            Int32 quizId = quizDataAdapter.GetQuizByName(QuizName)[0].QuizId;
            QuizDataSet.LearningDataTable learningRows = learningDataAdapter.GetDataByQuizId(quizId);
            if (learningRows != null)
            {
                return learningRows;
            }
            return null;
        }
    }
}