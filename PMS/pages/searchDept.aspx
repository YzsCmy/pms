<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Frame.Master" AutoEventWireup="true" CodeBehind="searchDept.aspx.cs" Inherits="PMS.pages.searchDept" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    	查询部门信息
                </h1>
                <ol class="breadcrumb">
                    <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li class="active">查询部门信息</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">
                <div class="row data-type">

                    <div class="col-md-2 title">部门编号</div>
					<div class="col-md-10 data">
                        <asp:TextBox ID="didText" runat="server" class="form-control" TextMode="Number" placeholder="输入部门名称" aria-describedby="sizing-addon1"></asp:TextBox>
					</div>

					<div class="col-md-2 title">部门名称</div>
					<div class="col-md-10 data">
                        <asp:TextBox ID="dNameText" runat="server" class="form-control" placeholder="输入部门名称" aria-describedby="sizing-addon1"></asp:TextBox>
					</div>

				     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT employee.eid, employee.ename, department.director FROM department INNER JOIN employee ON department.director = employee.eid"></asp:SqlDataSource>
					<div class="col-md-2 title">部门主管</div>
					<div class="col-md-10 data">
                         <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ename" DataValueField="eid" AppendDataBoundItems="true">
                             <asp:ListItem Value="0" Enabled="true">所有主管</asp:ListItem>
                         </asp:DropDownList>
					</div>
				
					<div class="col-md-2 title"></div>
					<div class="col-md-10 data text-center">
                         <asp:Button ID="Button1" runat="server" Text="查询" class="btn btn-success" OnClick="Button1_Click"/>
					</div>
				
				</div>

                <asp:GridView ID="girdView" runat="server" style="padding-top:30px;padding-bottom:30px;" AutoGenerateColumns="false" CssClass="table table-bordered table-striped table-hover dataTable">
                    <Columns>
                        <asp:BoundField DataField ="did" HeaderText="部门编号" />                
                        <asp:BoundField DataField ="dname"  HeaderText="部门名称" /> 
                        <asp:BoundField DataField ="director"  HeaderText="部门主管" /> 
                    </Columns>
                    <EmptyDataTemplate>
                        <table class="table table-bordered table-striped table-hover dataTable">
                        <tr style="font-weight:bold;">
                            <td>部门编号</td>
                            <td>部门名称</td>                 
                            <td>部门主管</td>
                        </tr>
                        <tr>
                            <td colspan="5" style="text-align:center;color:red">暂无资料</td>
                        </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:GridView> 
            </section>
            <!-- 正文区域 /-->
</asp:Content>
