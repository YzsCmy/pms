<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Frame.Master" AutoEventWireup="true" CodeBehind="edit_dele_emp.aspx.cs" Inherits="PMS.pages.edit_dele_emp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
        table {
            border-collapse: separate !important;
	        clear: both;
            margin-top: 6px !important;
            margin-bottom: 6px !important;
            max-width: none !important;
            border: 1px solid #f4f4f4;
            border: 1px solid #ddd;
            width: 100%;
            max-width: 100%;
            margin-bottom: 20px;
            background-color: transparent;
            border-spacing: 0;
            border-collapse: collapse;
    
            font-size:large;
            width: 100%;
            max-width: 100%;
            margin-bottom: 20px;
            border: 1px solid #ddd;
        }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
                <h1>
                    	员工信息管理
                </h1>
                <ol class="breadcrumb">
                    <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li class="active">员工信息管理</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [employee] WHERE [eid] = @eid" InsertCommand="INSERT INTO [employee] ([ename], [departId], [birth], [password], [status]) VALUES (@ename, @departId, @birth, @password, @status)" SelectCommand="SELECT * FROM [employee]" UpdateCommand="UPDATE [employee] SET [ename] = @ename, [departId] = @departId, [birth] = @birth, [password] = @password, [status] = @status WHERE [eid] = @eid">
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

                <asp:ListView ID="ListView1" runat="server" DataKeyNames="eid" DataSourceID="SqlDataSource1">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#C0C0C0; color: #000000;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                            </td>
                            <td>
                                <asp:Label ID="eidLabel" runat="server" Text='<%# Eval("eid") %>' />
                            </td>
                            <td>
                                <asp:Label ID="enameLabel" runat="server" Text='<%# Eval("ename") %>' />
                            </td>
                            <td>
                                <asp:Label ID="departIdLabel" runat="server" Text='<%# Eval("departId") %>' />
                            </td>
                            <td>
                                <asp:Label ID="birthLabel" runat="server" Text='<%# Eval("birth") %>' />
                            </td>
                            <td>
                                <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                            </td>
                            <td>
                                <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color:#FFFFFF; color: #000000;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                            </td>
                            <td>
                                <asp:Label ID="eidLabel1" runat="server" Text='<%# Eval("eid") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="enameTextBox" runat="server" Text='<%# Bind("ename") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="departIdTextBox" runat="server" Text='<%# Bind("departId") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="birthTextBox" runat="server" Text='<%# Bind("birth") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>未返回数据。</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <asp:TextBox ID="enameTextBox" runat="server" Text='<%# Bind("ename") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="departIdTextBox" runat="server" Text='<%# Bind("departId") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="birthTextBox" runat="server" Text='<%# Bind("birth") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#FFFFFF; color: #000000;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                            </td>
                            <td>
                                <asp:Label ID="eidLabel" runat="server" Text='<%# Eval("eid") %>' />
                            </td>
                            <td>
                                <asp:Label ID="enameLabel" runat="server" Text='<%# Eval("ename") %>' />
                            </td>
                            <td>
                                <asp:Label ID="departIdLabel" runat="server" Text='<%# Eval("departId") %>' />
                            </td>
                            <td>
                                <asp:Label ID="birthLabel" runat="server" Text='<%# Eval("birth") %>' />
                            </td>
                            <td>
                                <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                            </td>
                            <td>
                                <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color:#808080; color: #000000;">
                                            <th runat="server"></th>
                                            <th runat="server">员工编号</th>
                                            <th runat="server">员工姓名</th>
                                            <th runat="server">所属部门</th>
                                            <th runat="server">生日</th>
                                            <th runat="server">密码</th>
                                            <th runat="server">角色</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #FFFFFF; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color:#FFFFFF; font-weight: bold;color: #000000;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                            </td>
                            <td>
                                <asp:Label ID="eidLabel" runat="server" Text='<%# Eval("eid") %>' />
                            </td>
                            <td>
                                <asp:Label ID="enameLabel" runat="server" Text='<%# Eval("ename") %>' />
                            </td>
                            <td>
                                <asp:Label ID="departIdLabel" runat="server" Text='<%# Eval("departId") %>' />
                            </td>
                            <td>
                                <asp:Label ID="birthLabel" runat="server" Text='<%# Eval("birth") %>' />
                            </td>
                            <td>
                                <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                            </td>
                            <td>
                                <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
            </section>
</asp:Content>
