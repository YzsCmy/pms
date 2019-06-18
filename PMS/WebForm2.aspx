<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="PMS.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <script src="My97DatePicker/WdatePicker.js" type="text/javascript">
               alert(123);

        </script>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
                    <div>最早登记日期:</div><asp:TextBox ID="testDate" runat="server" TextMode="DateTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
        <asp:Label runat="server" ID="show"></asp:Label><br />
        <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click"/>
        <asp:Button ID="Button2" runat="server" Text="增加" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="删除" OnClick="Button3_Click" />
        <asp:Button ID="Button4" runat="server" Text="修改" OnClick="Button4_Click" />
        <br /><asp:Label runat="server" ID="text"></asp:Label>
            <div style="display:inline-block;">
        <asp:GridView ID="lendRepayMsgView" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField ="did" HeaderText="did" />                
                <asp:BoundField DataField ="dname"  HeaderText="dname" /> 
                <asp:BoundField DataField ="director"  HeaderText="director" /> 
            </Columns>
            <EmptyDataTemplate>
              <table style="border-collapse:collapse;" border="1">
              <tr style="font-weight:bold;">
                 <td style="width:67px;">did</td>
                 <td style="width:67px;">dname</td>                 
                 <td style="width:67px;">director</td>
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
