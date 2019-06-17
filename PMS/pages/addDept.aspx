﻿<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Frame.Master" AutoEventWireup="true" CodeBehind="addDept.aspx.cs" Inherits="PMS.pages.addDept" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
                <h1>
                    	录入部门信息
                </h1>
                <ol class="breadcrumb">
                    <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li class="active">录入部门信息</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">

				<div class="row data-type">

					<div class="col-md-2 title">部门名称</div>
					<div class="col-md-10 data">
                        <asp:TextBox ID="dname" runat="server"  class="form-control" placeholder="部门名称"></asp:TextBox>
					</div>
				
				
					<div class="col-md-2 title">部门主管</div>
					<div class="col-md-10 data">
                        <asp:TextBox ID="director" runat="server" class="form-control" placeholder="部门主管" ></asp:TextBox>
					</div>
				
					<div class="col-md-2 title"></div>
					<div class="col-md-10 data text-center">
                        <asp:Button ID="Button1" runat="server" class="btn bg-maroon" Text="保存" OnClick="Button1_Click" />
					</div>
				
				</div>

            </section>
</asp:Content>