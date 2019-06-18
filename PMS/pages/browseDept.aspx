<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Frame.Master" AutoEventWireup="true" CodeBehind="browseDept.aspx.cs" Inherits="PMS.pages.browseDept" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="content-header">
                <h1>
                    	浏览部门信息
                </h1>
                <ol class="breadcrumb">
                    <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li class="active">浏览部门信息</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [department]"></asp:SqlDataSource>
					<div class="col-md-10 data">
                        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="dname" DataValueField="did" AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Value="0" Enabled="true">所有部门</asp:ListItem>
                        </asp:DropDownList>
					</div>
                <div class="col-lg-6">
				</div>
        <div id="printdiv">
                <asp:GridView ID="GirdView"  style="padding-top:30px;padding-bottom:30px;" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped table-hover dataTable">
                    <Columns>
                        <asp:BoundField DataField ="eid" HeaderText="员工编号" />                
                        <asp:BoundField DataField ="ename"  HeaderText="员工姓名" /> 
                        <asp:BoundField DataField ="departId"  HeaderText="所属部门" /> 
                        <asp:BoundField DataField ="birth" HeaderText="出生日期" />                 
                        <asp:BoundField DataField ="status"  HeaderText="角色" />
                    </Columns>
                    <EmptyDataTemplate>
                      <table class="table table-bordered table-striped table-hover dataTable">
                      <tr style="font-weight:bold;">
                         <td>员工编号</td>
                         <td>员工姓名</td>                 
                         <td>所属部门</td>
                         <td>出生日期</td>
                         <td>角色</td>
                     </tr>
                     <tr>
                         <td colspan="5" style="text-align:center;color:red">暂无资料</td>
                     </tr>
                      </table>
                    </EmptyDataTemplate>
                 </asp:GridView> 
        </div>    
                <a href="#"  class="btn btn-info" onclick="printPage()" ><i class="fa fa-print"></i> 打印</a>
            </section>
     <script type="text/javascript">
        function printPage(name) 
        {
            var newWin = window.open('printer','','');
            var titleHTML = document.getElementById("printdiv").innerHTML;
            newWin.document.write(titleHTML);
            newWin.document.location.reload();
            newWin.print();
            newWin.close();
         }
    </script>
</asp:Content>

