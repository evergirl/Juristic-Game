using JuristicGame.sql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JuristicGame
{
    public partial class LearnForm : System.Web.UI.Page
    {
        QuizBO quizBo = new QuizBO();
        const String LINK_TRAGET_HOME = "~/Home.aspx";
        public const String PARAM_USERID = "UserName";
        String name;

        protected void Page_Load(object sender, EventArgs e)
        {
            AddValues();

            name = Request.QueryString[PARAM_USERID];
            if (!String.IsNullOrEmpty(name))
            {
                // user angegeben
            }
        }

        public void AddValues()
        {
            // set title
            lblTitle.Text = QuizBO.QuizName;

            // insert subtitles and paragraphs
            QuizDataSet.LearningDataTable learning = quizBo.GetLearning();
            foreach (QuizDataSet.LearningRow row in learning)
            {
                TableRow tr = new TableRow();

                // add subtitle
                TableCell cell1 = new TableCell();
                var lbl = new Label();
                lbl.Text = row.Subtitle;
                cell1.Controls.Add(lbl);
                tr.Cells.Add(cell1);

                // add information
                TableCell cell2 = new TableCell();
                var lbl2 = new Label();
                lbl2.Width = Unit.Pixel(300);
                lbl2.Text = row.TextKey;
                cell2.Controls.Add(lbl2);
                tr.Cells.Add(cell2);

                //add row to table
                tblContent.Rows.Add(tr);
            }
        }

        protected void btnHomeLearn_Click(object sender, EventArgs e)
        {
            Response.Redirect(LINK_TRAGET_HOME + "?" + PARAM_USERID + "=" + name, false);
        }
    }
}