using DAOS.LayerDao;
using GenericFunctions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School
{
    public partial class Default : System.Web.UI.Page
    {
        FunctionsGen fugen = new FunctionsGen();
        SchoolDao scdao = new SchoolDao();
        protected void Page_Load(object sender, EventArgs e)
        {
            scdao.GravaLog("Acessando Default");
        }
    }
}