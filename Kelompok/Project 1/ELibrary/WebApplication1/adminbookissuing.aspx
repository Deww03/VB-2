<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="WebApplication1.adminbookissuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("
                < thead ></thead > ").append($(this).find("tr: first"))).dataTable();
       });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-5">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col">
								<center>
									<h4>Peminjaman Buku</h4>
								</center>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<center>
									<img width="100px" src="imgs/books.png" />
								</center>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<hr>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>ID Anggota</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="ID Anggota"></asp:TextBox>
									</div>
								</div>
								<div class="col-md-6">
									<label>ID Buku</label>
									<div class="input-group">
										<asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="ID Buku"></asp:TextBox>
										<asp:Button for="TextBox1" class="btn btn-dark" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Nama Member</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Nama Member" ReadOnly="True"></asp:TextBox>
									</div>
								</div>
								<div class="col-md-6">
									<label>Nama Buku</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Nama Buku" ReadOnly="True"></asp:TextBox>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Tanggal Pembuatan</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Tanggal Mulai" TextMode="Date"></asp:TextBox>
									</div>
								</div>
								<div class="col-md-6">
									<label>Tenggat Waktu</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Tanggal Akhir" TextMode="Date"></asp:TextBox>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Peminjaman" OnClick="Button2_Click" />
								</div>
								<div class="col-6">
									<asp:Button ID="Button4" class="btn btn-lg btn-block btn-success" runat="server" Text="Pengembalian" OnClick="Button4_Click" />
								</div>
							</div>
						</div>
					</div>
					<a href="homepage.aspx"><< Kembali ke Home
					</a>
					<br>
						<br>
						</div>
						<div class="col-md-7">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<center>
												<h4>Daftar Buku yang Dipinjam</h4>
											</center>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<hr>
											</div>
										</div>
										<div class="row">
											<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:con %>' SelectCommand="SELECT * FROM [book_issue_tbl]">
											</asp:SqlDataSource>
											<div class="col">
												<asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
													<Columns>
														<asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id"></asp:BoundField>
														<asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name"></asp:BoundField>
														<asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id"></asp:BoundField>
														<asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name"></asp:BoundField>
														<asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date"></asp:BoundField>
														<asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date"></asp:BoundField>
													</Columns>
												</asp:GridView>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</asp:Content>