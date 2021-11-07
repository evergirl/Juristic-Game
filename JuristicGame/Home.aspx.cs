using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JuristicGame
{
    public partial class Home : System.Web.UI.Page
    {
        const String LINK_TRAGET_LEARN = "~/LearnForm.aspx";
        const String LINK_TRAGET_QUIZ = "~/QuizForm.aspx";
        public const String PARAM_USERID = "UserName";
        String name = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            name = Request.QueryString[PARAM_USERID];
            if (!String.IsNullOrEmpty(name))
            {
                // user angegeben
            }
        }

        protected void btnLearn_Click(Object sender, EventArgs e)
        {
            Response.Redirect(LINK_TRAGET_LEARN + "?" + PARAM_USERID + "=" + name, false);
        }

        protected void btnQuizMode_Click(Object sender, EventArgs e)
        {
            // bei page load role pruefen
            Response.Redirect(LINK_TRAGET_QUIZ + "?" + PARAM_USERID + "=" + name, false);
        }
    }
}