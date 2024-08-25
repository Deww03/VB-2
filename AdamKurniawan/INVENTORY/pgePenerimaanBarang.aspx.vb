Imports System
Imports System.Data
Imports System.Data.OleDb

Partial Public Class pgePenerimaanBarang
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
    Private m_intQty As Integer
    Private objReaderExists As OleDbDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            strCon = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=D:\Kuliah\VB2\AdamKurniawan\INVENTORY\INVENTORY.mdb;"
            If Not IsPostBack Then
                Call ListKodeBarang()
                Call ListGrid()
                ViewState.Add("QTY_OLD", "")
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub ListKodeBarang()
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()
            strSQL = "SELECT KD_BRG,NM_BRG FROM TBL_BARANG ORDER BY KD_BRG ASC"
            objCommand = New OleDbCommand(strSQL, myCon)
            objReader = objCommand.ExecuteReader()
            If objReader.HasRows Then
                While objReader.Read
                    ddlBarang.Items.Add(objReader("KD_BRG") & "---" & objReader("NM_BRG"))
                End While
            End If
            objReader.Close()
            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Try
            arrBarang = Split(ddlBarang.Text, "---")
            strKodeBarang = arrBarang(0)

            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "SELECT * FROM TBL_PENERIMAAN WHERE NO_PENERIMAAN = '" & txtNomor.Text & "' AND KD_BRG = '" & strKodeBarang & "'"
            objCommand = New OleDbCommand(strSQL, myCon)
            objReaderExists = objCommand.ExecuteReader()
            If objReaderExists.HasRows Then
                objReaderExists.Close()

                strSQL = "UPDATE TBL_PENERIMAAN SET TGL_TERIMA = '" & dtTglTrans.SelectedDate & "', QTY = " & CInt(txtQty.Text) & "	WHERE NO_PENERIMAAN = '" & txtNomor.Text & "'  AND KD_BRG = '" & strKodeBarang & "'"
                objCommand = New OleDbCommand(strSQL, myCon)
                If objCommand.ExecuteNonQuery() Then
                    strSQL = "SELECT * FROM TBL_STOCK WHERE KD_BRG = '" & strKodeBarang & "'"
                    objCommand = New OleDbCommand(strSQL, myCon)
                    objReader = objCommand.ExecuteReader()
                    If objReader.HasRows Then
                        objReader.Read()
                        dblSaldoIn = objReader("QTY_IN")
                        dblSaldoOut = objReader("QTY_OUT")
                        dblSaldoAkhir = objReader("QTY_AKHIR")

                        dblSaldoIn = dblSaldoIn + CInt(txtQty.Text) - ViewState.Item("QTY_OLD")
                        dblSaldoAkhir = dblSaldoIn - dblSaldoOut

                        strSQL = "UPDATE TBL_STOCK SET QTY_IN = " & dblSaldoIn & ", QTY_AKHIR = " & dblSaldoAkhir & " WHERE KD_BRG = '" & strKodeBarang & "'"
                        objCommand = New OleDbCommand(strSQL, myCon)
                        objCommand.ExecuteNonQuery()
                    End If
                    MsgBox("DATA SUDAH DI UPDATE")
                    Call ListGrid()
                Else
                    MsgBox("DATA TIDAK DAPAT DIUPDATE")
                End If
            Else
                objReaderExists.Close()
                strSQL = "INSERT INTO TBL_PENERIMAAN (NO_PENERIMAAN,TGL_TERIMA,KD_BRG,QTY) VALUES('" & txtNomor.Text & "','" & dtTglTrans.SelectedDate & "','" & strKodeBarang & "', " & CInt(txtQty.Text) & ")"
                objCommand = New OleDbCommand(strSQL, myCon)
                If objCommand.ExecuteNonQuery() Then

                    strSQL = "SELECT * FROM TBL_STOCK WHERE KD_BRG = '" & strKodeBarang & "'"
                    objCommand = New OleDbCommand(strSQL, myCon)
                    objReader = objCommand.ExecuteReader()
                    If objReader.HasRows Then
                        objReader.Read()
                        dblSaldoIn = objReader("QTY_IN")
                        dblSaldoOut = objReader("QTY_OUT")
                        dblSaldoAkhir = objReader("QTY_AKHIR")

                        dblSaldoIn = dblSaldoIn + CInt(txtQty.Text)
                        dblSaldoAkhir = dblSaldoIn - dblSaldoOut

                        strSQL = "UPDATE TBL_STOCK SET QTY_IN = " & dblSaldoIn & ", QTY_AKHIR = " & dblSaldoAkhir & " WHERE KD_BRG = '" & strKodeBarang & "'"
                        objCommand = New OleDbCommand(strSQL, myCon)
                        objCommand.ExecuteNonQuery()
                    Else
                        strSQL = "INSERT INTO TBL_STOCK (KD_BRG,QTY_IN,QTY_OUT,QTY_AKHIR) VALUES('" & strKodeBarang & "', " & CInt(txtQty.Text) & " , 0,           " & CInt(txtQty.Text) & ")"
                        objCommand = New OleDbCommand(strSQL, myCon)
                        objCommand.ExecuteNonQuery()
                    End If
                    objReader.Close()
                    MsgBox("DATA SUDAH DISIMPAN")
                    Call ListGrid()

                Else
                    MsgBox("DATA TIDAK DAPAT DISIMPAN")
                End If
            End If
            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub ListGrid()
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()
            strSQL = "SELECT DISTINCT B.NO_PENERIMAAN, B.TGL_TERIMA, B.KD_BRG, B.QTY, A.NM_BRG, A.HRG_SAT, (A.HRG_SAT * B.QTY) AS TOT_HRG FROM TBL_BARANG A, TBL_PENERIMAAN B  WHERE A.KD_BRG = B.KD_BRG ORDER BY B.NO_PENERIMAAN, B.KD_BRG ASC"
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

    Private Sub grdList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdList.SelectedIndexChanged
        Try
            txtNomor.Text = Trim(grdList.SelectedRow.Cells(1).Text)
            dtTglTrans.SelectedDate = CDate(grdList.SelectedRow.Cells(2).Text)
            ddlBarang.Text = Trim(grdList.SelectedRow.Cells(3).Text) & "---" & Trim(grdList.SelectedRow.Cells(4).Text)
            txtQty.Text = CDbl(grdList.SelectedRow.Cells(6).Text)
            txtHarga.Text = CDbl(grdList.SelectedRow.Cells(7).Text)

            ViewState.Item("QTY_OLD") = CInt(txtQty.Text)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Try
            arrBarang = Split(ddlBarang.Text, "---")
            strKodeBarang = arrBarang(0)

            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "DELETE FROM TBL_PENERIMAAN WHERE NO_PENERIMAAN = '" & txtNomor.Text & "' AND KD_BRG = '" & strKodeBarang & "'"
            objCommand = New OleDbCommand(strSQL, myCon)
            If objCommand.ExecuteNonQuery Then
                strSQL = "SELECT * FROM TBL_STOCK WHERE KD_BRG = '" & strKodeBarang & "'"
                objCommand = New OleDbCommand(strSQL, myCon)
                objReader = objCommand.ExecuteReader()
                If objReader.HasRows Then
                    objReader.Read()
                    dblSaldoIn = objReader("QTY_IN")
                    dblSaldoOut = objReader("QTY_OUT")
                    dblSaldoAkhir = objReader("QTY_AKHIR")

                    dblSaldoIn = dblSaldoIn - CInt(txtQty.Text)
                    dblSaldoAkhir = dblSaldoIn - dblSaldoOut

                    strSQL = "UPDATE TBL_STOCK SET QTY_IN = " & dblSaldoIn & ", QTY_AKHIR = " & dblSaldoAkhir & " WHERE KD_BRG = '" & strKodeBarang & "'"
                    objCommand = New OleDbCommand(strSQL, myCon)
                    objCommand.ExecuteNonQuery()
                End If
                MsgBox("DATA SUDAH DI UPDATE")
                Call ListGrid()
            End If
            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class