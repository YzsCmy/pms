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

				<div class="col-lg-6">
					<div class="input-group">
						<span class="input-group-addon glyphicon glyphicon-search" id="sizing-addon1"></span>
                        <asp:TextBox ID="dname" runat="server" class="form-control" placeholder="输入部门名称" aria-describedby="sizing-addon1"></asp:TextBox>
                        
					</div>
				</div>
                <div class="col-lg-2">
					<div class="input-group">
                        <asp:TextBox ID="director" runat="server"  class="form-control" placeholder="输入部门主管" aria-describedby="sizing-addon1"></asp:TextBox>
					</div>
					
				</div>
                <asp:Button ID="Button1" runat="server" Text="查询" class="btn btn-success" OnClick="Button1_Click"/>
                <asp:GridView ID="lendRepayMsgView" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField ="did" HeaderText="部门编号" />                
                        <asp:BoundField DataField ="dname"  HeaderText="部门名称" /> 
                        <asp:BoundField DataField ="director"  HeaderText="部门主管" /> 
                    </Columns>
                    <EmptyDataTemplate>
                        <table style="border-collapse:collapse;" border="1">
                        <tr style="font-weight:bold;">
                            <td style="width:67px;">部门编号</td>
                            <td style="width:67px;">部门名称</td>                 
                            <td style="width:67px;">部门主管</td>
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
