<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="PMS.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label runat="server" ID="show"></asp:Label><br />
        <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click"/>
        <asp:Button ID="Button2" runat="server" Text="增加" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="删除" OnClick="Button3_Click" />
        <asp:Button ID="Button4" runat="server" Text="修改" OnClick="Button4_Click" />
        <br /><asp:Label runat="server" ID="text"></asp:Label>
            <div style="display:inline-block;">
        <asp:GridView ID="lendRepayMsgView" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField ="eid" HeaderText="applyId" />                
                <asp:BoundField DataField ="ename"  HeaderText="studentNo" /> 
                <asp:BoundField DataField ="departId"  HeaderText="applyBookName" /> 
                <asp:BoundField DataField ="birth" HeaderText="applyBookPublishing" />                 
                <asp:BoundField DataField ="status"  HeaderText="applyBookAuthor" /> 
            </Columns>
            <EmptyDataTemplate>
              <table style="border-collapse:collapse;" border="1">
              <tr style="font-weight:bold;">
                 <td style="width:67px;">eid</td>
                 <td style="width:67px;">ename</td>                 
                 <td style="width:67px;">departId</td>
                 <td style="width:67px;">birth</td>
                 <td style="width:67px;">status</td>
             </tr>
             <tr>
                 <td colspan="5" style="text-align:center;color:red">暂无资料</td>
             </tr>
              </table>
            </EmptyDataTemplate>
        </asp:GridView> 
    </div>
    </form>
</body>
</html>
