using DAOS.Models;
using DAOS.LayerDao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace School
{
    public partial class Theachers : System.Web.UI.Page
    {
        SchoolDao scDao;
        Teacher teachers;
        string Sort_Direction = "TeacherID ASC";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ViewState["SortExpr"] = Sort_Direction;
                FillGrid();
            }
        }

        public void FillGrid()
        {
            try
            {
                scDao = new SchoolDao();

                DataTableReader reader = scDao.ListTeachers().CreateDataReader();
                DataTable dtTeachers = new DataTable();
                dtTeachers.Load(reader);
                DataView dvTeachers = dtTeachers.DefaultView;

                dvTeachers.Sort = ViewState["SortExpr"].ToString();

                //if (ViewState["FilterLastName"] !=null)
                //{
                //    dvTeachers.RowFilter = "TeacherLastName LIKE '*" + ViewState["FilterLastName"] + "*'";
                //}

                if (ViewState["FilterLastName"] != null || ViewState["FilterDepartment"] != null) {
                    string strFilter = "";
                    
                    if (ViewState["FilterLastName"] != null) {
                        strFilter = "TeacherLastName LIKE '*" + ViewState["FilterLastName"] + "*'";

                        if (ViewState["FilterDepartment"] != null)
                        {
                            strFilter = strFilter + " AND TeacherDepartment LIKE '*" + ViewState["FilterDepartment"].ToString() + "*'";
                        }
                    
                    }

                    else if (ViewState["FilterDepartment"] != null)
                    {
                        strFilter = strFilter + "TeacherDepartment LIKE '*" + ViewState["FilterDepartment"].ToString() + "*'";
                    }

                    dvTeachers.RowFilter = strFilter;

                }

                gvTeachers.DataSource = dvTeachers;
                gvTeachers.DataBind();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void gvTeachers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTeachers.EditIndex = -1;
            FillGrid();
        }

        protected void gvTeachers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTeachers.EditIndex = e.NewEditIndex;
            FillGrid();
        }

        protected void gvTeachers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            teachers = new Teacher();
            scDao = new SchoolDao();
            
            int intID = Convert.ToInt32(gvTeachers.DataKeys[e.RowIndex].Value.ToString());
            string strLastName = ((TextBox)gvTeachers.Rows[e.RowIndex].FindControl("txtLastName")).Text;
            string strFirstName = ((TextBox)gvTeachers.Rows[e.RowIndex].FindControl("txtFirstName")).Text;
            string strDateJoin = ((TextBox)gvTeachers.Rows[e.RowIndex].FindControl("txtDateJoin")).Text;
            string strDepartment = ((TextBox)gvTeachers.Rows[e.RowIndex].FindControl("txtDepartment")).Text;

            teachers.TeacherID = intID;
            teachers.TeacherLastName = strLastName;
            teachers.TeacherFirstName = strFirstName;
            teachers.TeacherDateJoin = Convert.ToDateTime(strDateJoin);
            teachers.TeacherDepartment = strDepartment;

            scDao.AlterTeachers(teachers);
            gvTeachers.EditIndex = -1;
            FillGrid();

        }

        protected void gvTeachers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            teachers = new Teacher();
            scDao = new SchoolDao();
            int intID = Convert.ToInt32(gvTeachers.DataKeys[e.RowIndex].Value.ToString());
            teachers.TeacherID = intID;
            scDao.DeleteTeachers(teachers);
            FillGrid();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("Teachers_Insert.aspx");
        }

        protected void gvTeachers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTeachers.PageIndex = e.NewPageIndex;
            FillGrid();
        }

        protected void gvTeachers_Sorting(object sender, GridViewSortEventArgs e)
        {
            string[] SortOrder = ViewState["SortExpr"].ToString().Split(' ');

            if (SortOrder[0] == e.SortExpression){
                if (SortOrder[1] == "ASC")
                {
                    ViewState["SortExpr"]=e.SortExpression + " " +"DESC";
                }

                else
                {
                    ViewState["SortExpr"]=e.SortExpression + " " +"ASC";
                }
                
            }
            else
            {
                ViewState["SortExpr"] = e.SortExpression + " " + "ASC";
            }
            FillGrid();
        }

        protected void btnFilterLastName_Click(object sender, EventArgs e)
        {
            ViewState["FilterLastName"] = txtFilterLastName.Text.ToString();
            FillGrid();
        }

        protected void btnResetLastName_Click(object sender, EventArgs e)
        {
            ViewState["FilterLastName"] = null;
            FillGrid();
        }

        protected void ddlDepartment_PreRender(object sender, EventArgs e)
        {

        }

        protected void ddlDepartment_IndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlDepartmentTemp = (DropDownList)sender;


            if (ddlDepartmentTemp.SelectedValue != "All")
            {
                ViewState["FilterDepartment"] = ddlDepartmentTemp.SelectedValue.ToString();
                FillGrid();
            }

            else
            {
                ViewState["FilterDepartment"] = null;
                FillGrid();
            }
        
        }


        protected void ddlDepartment_SetValue(object sender, EventArgs e)
        {
            if (ViewState["FilterDepartment"] != null)
            {
                DropDownList ddlDepartmentTemp = (DropDownList)gvTeachers.HeaderRow.FindControl("ddlDepartment");
                ddlDepartmentTemp.SelectedValue = ViewState["FilterDepartment"].ToString();
            }
        
        }

        protected void gvTeachers_Command(object sender, GridViewCommandEventArgs e)
        { 
          if(e.CommandName.Equals("Sort")){

              string[] SortOrder = ViewState["SortExpr"].ToString().Split(' ');

              if (SortOrder[0] == e.CommandArgument.ToString()) {

                  if (SortOrder[1] == "ASC")
                  {

                      ViewState["SortExpr"] = e.CommandArgument.ToString() + " " + "DESC";

                  }

                  else {

                      ViewState["SortExpr"] = e.CommandArgument.ToString() + " " + "ASC";
                  }
              
              }
              else
              {
                  ViewState["SortExpr"] = e.CommandArgument.ToString() + " " + "ASC";
              }

              FillGrid();
          }

        }
        
      
    }
}