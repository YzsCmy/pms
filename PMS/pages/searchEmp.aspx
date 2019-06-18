<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Frame.Master" AutoEventWireup="true" CodeBehind="searchEmp.aspx.cs" Inherits="PMS.pages.searchEmp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    	查询员工信息
                </h1>
                <ol class="breadcrumb">
                    <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li class="active">查询员工信息</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">
                	<div class="row data-type">

                    <div class="col-md-2 title">员工编号</div>
					<div class="col-md-10 data">
                        <asp:TextBox ID="eidText" runat="server" class="form-control" placeholder="员工编号"></asp:TextBox>
					</div>
					<div class="col-md-2 title">员工姓名</div>
					<div class="col-md-10 data">
                        <asp:TextBox ID="eNameText" runat="server" class="form-control" placeholder="员工姓名"></asp:TextBox>
					</div>
		
					<div class="col-md-2 title">最小年龄</div>
					<div class="col-md-10 data">
                        <asp:TextBox ID="minAgeText" runat="server"  class="form-control" placeholder="最小年龄" TextMode="Number" min="16"></asp:TextBox>
					</div>

					<div class="col-md-2 title">最大年龄</div>
					<div class="col-md-10 data">
                        <asp:TextBox ID="maxAgeText" runat="server"  class="form-control" placeholder="最大年龄" TextMode="Number" min="18"></asp:TextBox>
					</div>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [department]"></asp:SqlDataSource>
				    <div class="col-md-2 title">所属部门</div>
					<div class="col-md-10 data">
                        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="dname" DataValueField="did" AppendDataBoundItems="true">
                            <asp:ListItem Value="0" Enabled="true">所有部门</asp:ListItem>
                        </asp:DropDownList>
					</div>
				
					<div class="col-md-2 title"></div>
					<div class="col-md-10 data text-center">
                         <asp:Button ID="Button1" runat="server" Text="查询" class="btn btn-success" OnClick="Button1_Click"/>
					</div>
				
				</div>
                
                <asp:GridView ID="lendRepayMsgView"  style="padding-top:30px;padding-bottom:30px;" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped table-hover dataTable">
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
            </section>
            <!-- 正文区域 /-->
</asp:Content>
