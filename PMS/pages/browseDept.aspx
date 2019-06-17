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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT did AS 部门编号, dname AS 部门名称, director AS 部门主管 FROM department"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="部门编号" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="部门编号" HeaderText="部门编号" InsertVisible="False" ReadOnly="True" SortExpression="部门编号" />
                        <asp:BoundField DataField="部门名称" HeaderText="部门名称" SortExpression="部门名称" />
                        <asp:BoundField DataField="部门主管" HeaderText="部门主管" SortExpression="部门主管" />
                    </Columns>
                </asp:GridView>
                <a href="#"  class="btn btn-info"><i class="fa fa-print"></i> 打印</a>
            </section>
</asp:Content>

