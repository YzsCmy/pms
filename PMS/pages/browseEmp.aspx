<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Frame.Master" AutoEventWireup="true" CodeBehind="browseEmp.aspx.cs" Inherits="PMS.pages.browseEmp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="content-header">
                <h1>
                    	浏览员工信息
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.aspx"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li class="active">浏览员工信息</li>
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
                <asp:Button ID="Button1" runat="server" Text="查询" class="btn btn-success"/>

                <div class="col-lg-6">
				</div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select eid as 员工编号,ename as 员工姓名,departId as 所属部门, birth as 生日, status as 角色 from employee" DeleteCommand="DELETE FROM [employee] WHERE [eid] = @eid" InsertCommand="INSERT INTO [employee] ([ename], [departId], [birth], [password], [status]) VALUES (@ename, @departId, @birth, @password, @status)" UpdateCommand="UPDATE [employee] SET [ename] = @ename, [departId] = @departId, [birth] = @birth, [password] = @password, [status] = @status WHERE [eid] = @eid">
                    <DeleteParameters>
                        <asp:Parameter Name="eid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ename" Type="String" />
                        <asp:Parameter Name="departId" Type="Int32" />
                        <asp:Parameter Name="birth" Type="DateTime" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="status" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ename" Type="String" />
                        <asp:Parameter Name="departId" Type="Int32" />
                        <asp:Parameter Name="birth" Type="DateTime" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="status" Type="Int32" />
                        <asp:Parameter Name="eid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
         <div id="printdiv">
                <asp:GridView ID="GridView1" style="padding-top:30px;padding-bottom:30px;"  runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="员工编号" CssClass="table table-bordered table-striped table-hover dataTable">
                    <Columns>
                        <asp:BoundField DataField="员工编号" HeaderText="员工编号" InsertVisible="False" ReadOnly="True" SortExpression="员工编号" />
                        <asp:BoundField DataField="员工姓名" HeaderText="员工姓名" SortExpression="员工姓名" />
                        <asp:BoundField DataField="所属部门" HeaderText="所属部门" SortExpression="所属部门" />
                        <asp:BoundField DataField="生日" HeaderText="生日" SortExpression="生日" />
                        <asp:BoundField DataField="角色" HeaderText="角色" SortExpression="角色" />
                    </Columns>
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
