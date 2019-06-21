<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Frame.Master" AutoEventWireup="true" CodeBehind="addEmp.aspx.cs" Inherits="PMS.pages.addEmp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
                <h1>
                    	录入员工信息
                </h1>
                <ol class="breadcrumb">
                    <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li class="active">录入员工信息</li>
                </ol>
            </section>
            <!-- 内容头部 /-->
            <!-- 正文区域 -->
            <section class="content">

				<div class="row data-type">

					<div class="col-md-2 title">员工姓名</div>
					<div class="col-md-10 data">
                        <asp:TextBox ID="ename" runat="server" class="form-control" placeholder="员工姓名"></asp:TextBox>
					</div>
				
				
					<div class="col-md-2 title">登入密码</div>
					<div class="col-md-10 data">
                        <asp:TextBox ID="pwd" runat="server" TextMode="Password" class="form-control" placeholder="登入密码"></asp:TextBox>
					</div>
					
					<div class="col-md-2 title">出生日期</div>
					<div class="col-md-10 data">
                        <asp:TextBox ID="birth" runat="server"  class="form-control" placeholder="出生日期" TextMode="DateTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-{%d}'})"></asp:TextBox>
					</div>
				
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [department]"></asp:SqlDataSource>
				    <div class="col-md-2 title">所属部门</div>
					<div class="col-md-4 data">
                        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="dname" DataValueField="did"></asp:DropDownList>
						
					</div>
                    <div class="col-md-6 data">
						
					</div>
                    <div class="col-md-2 title">角色</div>
					<div class="col-md-10 data">
                        <asp:TextBox ID="status" runat="server" class="form-control" placeholder="角色"></asp:TextBox>
					</div>
					
				
					<div class="col-md-2 title"></div>
					<div class="col-md-4 data text-center">
                        <asp:Button ID="Button1" runat="server" class="btn bg-maroon" Text="保存" OnClick="Button1_Click" />
					</div>
				
				</div>
            </section>
    <script type="text/javascript">
        function input() {
            if (document.getElementById("ContentPlaceHolder1_ename").value == "") {
                alert("姓名不可为空!");
                return false;
            }
            if (document.getElementById("ContentPlaceHolder1_pwd").value == "") {
                alert("登陆密码不可为空!");
                return false;
            }
            if (document.getElementById("ContentPlaceHolder1_birth").value == "") {
                alert("出生日期不可为空!");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
