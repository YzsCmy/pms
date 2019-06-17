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

				<div class="col-lg-6">
					<div class="input-group">
						<span class="input-group-addon glyphicon glyphicon-search" id="sizing-addon1"></span>
                        <asp:TextBox ID="ename" runat="server" class="form-control" placeholder="输入员工名称" aria-describedby="sizing-addon1"></asp:TextBox>
                        
					</div>
				</div>
                <div class="col-lg-2">
					<div class="input-group">
                        <asp:TextBox ID="age" runat="server" class="form-control" placeholder="输入员工年龄" aria-describedby="sizing-addon1"></asp:TextBox>
					</div>
					
				</div>
                <asp:Button ID="Button1" runat="server" Text="查询" class="btn btn-success" OnClick="Button1_Click"/>

                <asp:GridView ID="lendRepayMsgView" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField ="eid" HeaderText="员工编号" />                
                        <asp:BoundField DataField ="ename"  HeaderText="员工姓名" /> 
                        <asp:BoundField DataField ="departId"  HeaderText="所属部门" /> 
                        <asp:BoundField DataField ="birth" HeaderText="生日" />                 
                        <asp:BoundField DataField ="status"  HeaderText="角色" /> 
                    </Columns>
                    <EmptyDataTemplate>
                      <table style="border-collapse:collapse;" border="1">
                      <tr style="font-weight:bold;">
                         <td style="width:67px;">员工编号</td>
                         <td style="width:67px;">员工姓名</td>                 
                         <td style="width:67px;">所属部门</td>
                         <td style="width:67px;">生日</td>
                         <td style="width:67px;">角色</td>
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
