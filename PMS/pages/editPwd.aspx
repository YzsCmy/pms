<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Frame.Master" AutoEventWireup="true" CodeBehind="editPwd.aspx.cs" Inherits="PMS.pages.editPwd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
                <h1>
                    	修改密码
                </h1>
                <ol class="breadcrumb">
                    <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li class="active">修改密码</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">
                <div class="row data-type">
	
		            <div class="col-md-2 title">当前密码</div>
		            <div class="col-md-10 data">
                        <asp:TextBox ID="pwd" runat="server"  class="form-control"  placeholder="登入密码" TextMode="Password"></asp:TextBox>

		            </div>
				
		            <div class="col-md-2 title">修改密码</div>
		            <div class="col-md-10 data">
                        <asp:TextBox ID="epwd" runat="server"  class="form-control"  placeholder="修改密码" TextMode="Password"></asp:TextBox>
		            </div>
				
		            <div class="col-md-2 title">确认修改密码</div>
		            <div class="col-md-10 data">
                        <asp:TextBox ID="repwd" runat="server"  class="form-control"  placeholder="确认修改密码" TextMode="Password"></asp:TextBox>
		            </div>
				
           
		            <div class="col-md-2 title"></div>
		            <div class="col-md-10 data text-center">
                        <asp:button runat="server" text="保存" class="btn bg-maroon" OnClick="Unnamed1_Click"/>
		            </div>

                    <div class="col-md-2 title"></div>
		            <div class="col-md-10 data text-center">
                        <asp:label runat="server" ForeColor="Black" ID="msg"  ></asp:label>
		            </div>
				
	            </div>
            </section>
    
				 
</asp:Content>
