<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="LATIHAN5._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style2
        {
            width: 133px;
        }
        .style3
        {
            width: 91px;
        }
        .style4
        {
            width: 52px;
        }
        .style5
        {
            width: 126px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style=" width:705px; height:286px; margin:auto; background:gray; padding-top:10px;">
        <div style=" width:660px; height:35px; margin:auto; background:white; padding-left:10px; padding-top:10px;">
            <table style="margin:auto;">
                <tr>
                    <td>
                        <asp:label ID="Label1" runat="server" Text="LATIHAN" Font-Bold="true" Font-Size="X-Large" ></asp:label>
                    </td>
                </tr>
            </table>
        </div>
        
        <div style=" width:657px; height:208px; background:white; padding-left:10px; padding-top:10px; margin-top:10px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
            <table style="height: 198px; width: 647px">
                <tr>
                    <td class="style2">NIK</td>
                    <td colspan="4">
                        <asp:TextBox ID="txtNIK" runat="server" Width="139px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">Nama Karyawan</td>
                    <td colspan="4">
                        <asp:TextBox ID="txtNama" runat="server" Width="497px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">Bagian</td>
                    <td colspan="4">
                        <asp:TextBox ID="txtBagian" runat="server" Width="497px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">Status Karyawan</td>
                    <td>
                        <asp:RadioButtonList ID="optStatus" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                            <asp:ListItem Text="Kontrak" Value="K"></asp:ListItem>
                            <asp:ListItem Text="Tetap" Value="T"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td </td class="style4">
                    <td class="style3">Gaji Pokok</td>
                    <td class="style5">
                        <asp:TextBox ID="txtGajiPokok" runat="server" ReadOnly="true" style="text-align:right;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">Tunjangan</td>
                    <td>
                        <asp:TextBox ID="txtTunjangan" runat="server" style="text-align:right;"></asp:TextBox>
                    </td>
                    <td class="style4"></td>
                    <td class="style3">Pajak Pph 21</td>
                    <td class="style5">
                        <asp:TextBox ID="txtPph" runat="server" ReadOnly="true" style="text-align:right;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">Gaji Bersih</td>
                    <td>
                        <asp:TextBox ID="txtGajiBersih" runat="server" ReadOnly="true" style="text-align:right;"></asp:TextBox>
                    </td>
                    <td class="style4"></td>
                    <td colspan="2" style="text-align:right;">
                        <asp:Button ID="btnHitung" runat="server" Text="Hitung" Width="85px" />
                        <asp:Button ID="btnBatal" runat="server" Text="Button" Width="80px" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
