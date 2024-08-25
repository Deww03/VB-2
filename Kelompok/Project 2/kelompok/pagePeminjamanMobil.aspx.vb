Imports System
Imports System.Data
Imports System.Data.OleDb
Partial Public Class pagePeminjamanMobil
    Inherits System.Web.UI.Page
    Private strCon As String
    Private strSQL As String
    Private objDataTable As DataTable
    Private objReader As OleDbDataReader
    Private objAdapter As OleDbDataAdapter
    Private objDataset As DataSet
    Private myCon As OleDbConnection
    Private objCommand As OleDbCommand
    Private strKodeMobil As String
    Private arrMobil(2) As String
    Private dblQtyAdd As Double
    Private dblQtyIn As Double
    Private dblQtyAkhir As Double
    Private dblQtyOut As Double
    Private objReaderExists As OleDbDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Cek apakah sesi login ada
        If Session("LoggedIn") Is Nothing OrElse Not CType(Session("LoggedIn"), Boolean) Then
            ' Jika tidak ada, redirect ke halaman login
            Response.Redirect("pageLogin.aspx")
        End If
        Try
            strCon = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=D:\Project\ASP\kelompok\kelompok.mdb;"
            If Not IsPostBack Then
                Call IsiDataMobil()
                Call ListGrid()
                ViewState.Add("QTY_OLD", "")
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub IsiDataMobil()
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "SELECT KD_MOBIL, NM_MOBIL FROM TBL_MOBIL ORDER BY KD_MOBIL ASC"
            objCommand = New OleDbCommand(strSQL, myCon)
            objReader = objCommand.ExecuteReader()

            If objReader.HasRows Then
                While objReader.Read
                    ddlMobil.Items.Add(objReader("KD_MOBIL") & "---" & objReader("NM_MOBIL"))
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
            Erase arrMobil
            arrMobil = Split(ddlMobil.Text, "---")
            strKodeMobil = arrMobil(0)

            myCon = New OleDbConnection(strCon)
            myCon.Open()
            strSQL = "SELECT * FROM TBL_PEMINJAMAN WHERE NAMA_CUSTOMER = '" & txtNamaCustomer.Text & "' AND KD_MOBIL = '" & strKodeMobil & "'"
            objCommand = New OleDbCommand(strSQL, myCon)
            objReaderExists = objCommand.ExecuteReader()
            If objReaderExists.HasRows Then
                objReaderExists.Close()
                'Update
                strSQL = "UPDATE TBL_PEMINJAMAN SET TGL_PEMINJAMAN = '" & dtTgl.SelectedDate & "',QTY = " & CInt(txtQty.Text) & " WHERE NAMA_CUSTOMER = '" & txtNamaCustomer.Text & "' AND KD_MOBIL = '" & strKodeMobil & "'"
                objCommand = New OleDbCommand(strSQL, myCon)
                If objCommand.ExecuteNonQuery() Then
                    strSQL = "SELECT * FROM TBL_STOCK WHERE KD_MOBIL = '" & strKodeMobil & "'"
                    objCommand = New OleDbCommand(strSQL, myCon)
                    objReader = objCommand.ExecuteReader()
                    If objReader.HasRows Then
                        objReader.Read()
                        dblQtyAdd = objReader("QTY_ADD")
                        dblQtyIn = objReader("QTY_IN")
                        dblQtyOut = objReader("QTY_OUT")
                        dblQtyAkhir = objReader("QTY_AKHIR")

                        dblQtyOut = dblQtyOut + CInt(txtQty.Text) - ViewState.Item("QTY_OLD")
                        dblQtyAkhir = dblQtyAdd - dblQtyOut

                        strSQL = "UPDATE TBL_STOCK SET QTY_OUT = " & dblQtyOut & ", QTY_AKHIR = " & dblQtyAkhir & " WHERE KD_MOBIL = '" & strKodeMobil & "'"
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
                'Insert
                strSQL = "INSERT INTO TBL_PEMINJAMAN (NAMA_CUSTOMER,TGL_PEMINJAMAN,KD_MOBIL,QTY) VALUES ('" & txtNamaCustomer.Text & "','" & dtTgl.SelectedDate & "','" & strKodeMobil & "'," & txtQty.Text & ")"
                objCommand = New OleDbCommand(strSQL, myCon)

                If objCommand.ExecuteNonQuery() Then
                    strSQL = "SELECT * FROM TBL_STOCK WHERE KD_MOBIL = '" & strKodeMobil & "'"
                    objCommand = New OleDbCommand(strSQL, myCon)
                    objReader = objCommand.ExecuteReader()

                    If objReader.HasRows Then
                        objReader.Read()
                        dblQtyAdd = objReader("QTY_ADD")
                        dblQtyIn = objReader("QTY_IN")
                        dblQtyAkhir = objReader("QTY_AKHIR")
                        dblQtyOut = objReader("QTY_OUT")

                        dblQtyOut = dblQtyOut + CInt(txtQty.Text)
                        dblQtyAkhir = dblQtyAdd - dblQtyOut

                        strSQL = "UPDATE TBL_STOCK SET QTY_OUT = " & dblQtyOut & ", QTY_AKHIR = " & dblQtyAkhir & " WHERE KD_MOBIL = '" & strKodeMobil & "'"

                        objCommand = New OleDbCommand(strSQL, myCon)
                        objCommand.ExecuteNonQuery()
                    Else
                        strSQL = "INSERT INTO TBL_STOCK (KD_MOBIL,QTY_IN,QTY_OUT,QTY_AKHIR) VALUES('" & strKodeMobil & "',0," & txtQty.Text & "," & txtQty.Text & ")"

                        objCommand = New OleDbCommand(strSQL, myCon)
                        objCommand.ExecuteNonQuery()
                    End If
                    objReader.Close()
                    MsgBox("DATA SUDAH DISIMPAN")
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

            strSQL = "SELECT DISTINCT B.NAMA_CUSTOMER,B.TGL_PEMINJAMAN,B.KD_MOBIL,A.NM_MOBIL,a.HRG_SEWA,B.QTY,(a.HRG_SEWA * B.QTY) AS TOT_HRG FROM TBL_MOBIL A, TBL_PEMINJAMAN B WHERE A.KD_MOBIL = B.KD_MOBIL ORDER BY B.NAMA_CUSTOMER,B.KD_MOBIL ASC"
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
            txtNamaCustomer.Text = Trim(grdList.SelectedRow.Cells(1).Text)
            dtTgl.SelectedDate = CDate(grdList.SelectedRow.Cells(2).Text)

            ddlMobil.Text = Trim(grdList.SelectedRow.Cells(3).Text) & "---" & Trim(grdList.SelectedRow.Cells(4).Text)

            txtQty.Text = CDbl(grdList.SelectedRow.Cells(6).Text)
            txtTotalHarga.Text = CDbl(grdList.SelectedRow.Cells(7).Text)

            ViewState.Item("QTY_OLD") = CInt(txtQty.Text)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub


    Private Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Try
            arrMobil = Split(ddlMobil.Text, "---")
            strKodeMobil = arrMobil(0)

            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "DELETE FROM TBL_PEMINJAMAN WHERE NAMA_CUSTOMER = '" & txtNamaCustomer.Text & "' AND KD_MOBIL = '" & strKodeMobil & "'"
            objCommand = New OleDbCommand(strSQL, myCon)
            If objCommand.ExecuteNonQuery Then
                strSQL = "SELECT * FROM TBL_STOCK WHERE KD_MOBIL = '" & strKodeMobil & "'"
                objCommand = New OleDbCommand(strSQL, myCon)
                objReader = objCommand.ExecuteReader()
                If objReader.HasRows Then
                    objReader.Read()
                    dblQtyAdd = objReader("QTY_ADD")
                    dblQtyIn = objReader("QTY_IN")
                    dblQtyOut = objReader("QTY_OUT")
                    dblQtyAkhir = objReader("QTY_AKHIR")

                    dblQtyOut = dblQtyOut - CInt(txtQty.Text)
                    dblQtyAkhir = dblQtyIn - dblQtyOut + dblQtyAdd

                    strSQL = "UPDATE TBL_STOCK SET QTY_OUT = " & dblQtyOut & ", QTY_AKHIR = " & dblQtyAkhir & " WHERE KD_MOBIL = '" & strKodeMobil & "'"
                    objCommand = New OleDbCommand(strSQL, myCon)
                    objCommand.ExecuteNonQuery()
                End If
                MsgBox("DATA SUDAH DI HAPUS")
                Call ListGrid()
            End If
            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class