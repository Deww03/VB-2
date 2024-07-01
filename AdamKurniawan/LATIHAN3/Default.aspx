<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="LATIHAN3._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
        <style type="text/css">
            .KOTAK_ULAMA
            {
            	width:270px; 
            	height:130px; 
            	background:pink; 
            	margin:auto;
            }         
        </style>
        
        <script type="text/jsscript">
            function OnlyNumericEntry(){
                if {(event.keycode < 48 || event.keycode > 57)} {
                event.returnValue = false;
                }
            }
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="KOTAK_ULAMA">
        <table>
            <tr>
                <td colspan="2"><center><b><u>FORM INPUT DATA</u></b></center></td>
            </tr>
            <tr>
                <td colspan="2"> &nbsp; </td>
            </tr>
            <tr>
                <td>NIM : </td>
                <td>
                    <asp:TextBox ID="txtNIM" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>NAMA : </td>
                <td>
                    <asp:TextBox ID="txtNAMA" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>JURUSAN : </td>
                <td>
                    <asp:TextBox ID="txtJURUSAN" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
