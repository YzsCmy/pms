<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Frame.Master" AutoEventWireup="true" CodeBehind="edit_dele_dept.aspx.cs" Inherits="PMS.pages.edit_dele_dept" %>
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
                    	部门信息管理
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.aspx"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li class="active">部门信息管理</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [department] WHERE [did] = @did" InsertCommand="INSERT INTO [department] ([dname], [director]) VALUES (@dname, @director)" SelectCommand="SELECT * FROM [department]" UpdateCommand="UPDATE [department] SET [dname] = @dname, [director] = @director WHERE [did] = @did">
                    <DeleteParameters>
                        <asp:Parameter Name="did" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="dname" Type="String" />
                        <asp:Parameter Name="director" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="dname" Type="String" />
                        <asp:Parameter Name="director" Type="Int32" />
                        <asp:Parameter Name="did" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:ListView ID="ListView1" runat="server"  DataKeyNames ="did" DataSourceID="SqlDataSource1">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #C0C0C0; color: #000000;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                            </td>
                            <td>
                                <asp:Label ID="didLabel" runat="server" Text='<%# Eval("did") %>' />
                            </td>
                            <td>
                                <asp:Label ID="dnameLabel" runat="server" Text='<%# Eval("dname") %>' />
                            </td>
                            <td>
                                <asp:Label ID="directorLabel" runat="server" Text='<%# Eval("director") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: #FFFFFF; color: #000000;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                            </td>
                            <td>
                                <asp:Label ID="didLabel1" runat="server" Text='<%# Eval("did") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="dnameTextBox" runat="server" Text='<%# Bind("dname") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="directorTextBox" runat="server" Text='<%# Bind("director") %>' />
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
                                <asp:TextBox ID="dnameTextBox" runat="server" Text='<%# Bind("dname") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="directorTextBox" runat="server" Text='<%# Bind("director") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate  >
                        <tr style="background-color: #FFFFFF; color: #000000;" >
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                            </td>
                            <td>
                                <asp:Label ID="didLabel" runat="server" Text='<%# Eval("did") %>' />
                            </td>
                            <td>
                                <asp:Label ID="dnameLabel" runat="server" Text='<%# Eval("dname") %>' />
                            </td>
                            <td>
                                <asp:Label ID="directorLabel" runat="server" Text='<%# Eval("director") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #808080; color: #000000;">
                                            <th runat="server"></th>
                                            <th runat="server">部门编号</th>
                                            <th runat="server">部门名称</th>
                                            <th runat="server">部门主管</th>
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
                        <tr style="background-color: #FFFFFF; font-weight: bold;color: #000000;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                            </td>
                            <td>
                                <asp:Label ID="didLabel" runat="server" Text='<%# Eval("did") %>' />
                            </td>
                            <td>
                                <asp:Label ID="dnameLabel" runat="server" Text='<%# Eval("dname") %>' />
                            </td>
                            <td>
                                <asp:Label ID="directorLabel" runat="server" Text='<%# Eval("director") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>

            </section>
</asp:Content>
