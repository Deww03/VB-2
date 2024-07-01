<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="LATIHAN4._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
        <table>
            <tr>
                <td colspan="2"><center><h2><u>PERHITUNGAN</u></h2></center></td>
            </tr>
            <tr>
                <td>NIK : </td>
                <td>
                    <asp:TextBox ID="txtNIK" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>GAJI POKOK : </td>
                <td>
                    <asp:TextBox ID="txtGAPOK" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>TUNJANGAN : </td>
                <td>
                    <asp:TextBox ID="txtTUNJANGAN" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>POTONGAN : </td>
                <td>
                    <asp:TextBox ID="txtPOTONGAN" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>GAJI BERSIH : </td>
                <td>
                    <asp:TextBox ID="txtGABER" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnHITUNG" runat="server" Text="HITUNG" />
                </td>
            </tr>
        </table>
    </center>
    </div>
    </form>
</body>
</html>
