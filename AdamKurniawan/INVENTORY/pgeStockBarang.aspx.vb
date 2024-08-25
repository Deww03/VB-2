Imports System
Imports System.Data
Imports System.Data.OleDb

Partial Public Class pgeStockBarang
    Inherits System.Web.UI.Page

    Private strSQL As String
    Private objDataTable As DataTable
    Private objReader As OleDbDataReader
    Private myCon As OleDbConnection
    Private objCommand As OleDbCommand
    Private strCon As String
    Private objAdapter As OleDbDataAdapter
    Private objDataset As DataSet
    Private strKodeBarang As String
    Private arrBarang(2) As String
    Private dblSaldoIn As Double
    Private dblSaldoOut As Double
    Private dblSaldoAkhir As Double

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            strCon = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=D:\Kuliah\VB2\AdamKurniawan\INVENTORY\INVENTORY.mdb;"
            If Not IsPostBack Then
                Call ListGrid()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub ListGrid()
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "SELECT B.QTY_IN, B.QTY_OUT, B.QTY_AKHIR, B.KD_BRG, A.NM_BRG, A.SPEC_BRG, A.SAT_BRG, A.HRG_SAT FROM TBL_BARANG A, TBL_STOCK B WHERE A.KD_BRG = B.KD_BRG ORDER BY B.KD_BRG ASC"
            objAdapter = New OleDbDataAdapter(strSQL, myCon)
            objDataset = New DataSet
            objAdapter.Fill(objDataset)
            grdList.DataSource = objDataset
            grdList.DataBind()

            myCon.Close()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class