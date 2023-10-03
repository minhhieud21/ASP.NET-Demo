<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
                <asp:PlaceHolder ID="PlaceHolder4" runat="server"></asp:PlaceHolder>
            </h1>
        </section>
        <input class="btn btn-primary" type="button" value="Thêm sản phẩm" id ="Themsp">
        <button class="btn btn-primary" id="in" style="position: absolute;right: 40px;">In</button>
              <div id="popupContainer" class="modal" tabindex="-1" >
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Tạo sản phẩm mới</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="nutdongthem"></button>
                    </div>
                    <div class="modal-body">
                      <div class="mb-3">
                        <label for="name" class="form-label">Tên sản phẩm:</label>
                        <input type="text" id="name" class="form-control" placeholder="Nhập tên sản phẩm">
                      </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Loại sản phẩm:</label>
                       <select class="form-select" aria-label="Default select example" id="type">
                          <option value="0" selected>Loại sản phẩm</option>
                          <option value="2">Hàng công nghiệp</option>
                          <option value="1">Hàng tiêu dùng</option>
                        </select>
                    </div>
                        <div class="mb-3">
                            <label for="name" class="form-label">Đơn vị tính:</label>
                           <select class="form-select" aria-label="Default select example" id="donvi">
                              <option value="0" selected>Đơn vị tính</option>
                              <option value="1">Cái</option>
                              <option value="2">Lon</option>
                              <option value="3">Thùng</option>
                            </select>
                        </div>
                      <div class="mb-3">
                        <label for="price" class="form-label">Giá sản phẩm:</label>
                        <input type="text" id="price" class="form-control" placeholder="Nhập giá sản phẩm">
                      </div>
                      <div class="mb-3">
                        <label for="note" class="form-label">Note:</label>
                        <input type="text" id="note" class="form-control" placeholder="Nhập ghi chú">
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" id="createProduct">Tạo sản phẩm</button>
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="nutdongthem1">Đóng</button>
                    </div>
                  </div>
                </div>
              </div>
        <div id="editPopup" class="modal" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Sửa thông tin sản phẩm</h5>
                    <input type="text" id="value" style="display: none;">
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <div class="mb-3">
                    <label for="editName" class="form-label">Tên sản phẩm:</label>
                    <input type="text" id="editName" class="form-control" placeholder="Nhập tên sản phẩm">
                  </div>
                    <label for="editType" class="form-label">Loại sản phẩm:</label>
                        <select class="form-select" id="editType">
                          <option value="0">Loại sản phẩm</option>
                          <option value="1">Hàng tiêu dùng</option>
                          <option value="2">Hàng công nghiệp</option>
                        </select>
                    <label for="editType" class="form-label">Đơn vị tính:</label>
                        <select class="form-select" id="editDonvi">
                           <option value="1">Cái</option>
                           <option value="2">Lon</option>
                           <option value="3">Thùng</option>
                        </select>
                  <div class="mb-3">
                    <label for="editPrice" class="form-label">Giá sản phẩm:</label>
                    <input type="text" id="editPrice" class="form-control" placeholder="Nhập giá sản phẩm">
                  </div>
                    <div class="mb-3">
                      <label for="editPrice" class="form-label">Ghi chú:</label>
                      <input type="text" id="editNote" class="form-control" placeholder="Nhập ghi chú">
                    </div>
                  <div class="mb-3">
                    
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" id="saveProduct">Lưu</button>
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                </div>
              </div>
            </div>
          </div>
        <div class="row">            
            <table class="table table-striped">
            <asp:PlaceHolder ID="PlaceHolder5" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="PlaceHolder6" runat="server"></asp:PlaceHolder>
            <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            <asp:Panel ID="Panel2" runat="server"></asp:Panel>
            <asp:Panel ID="Panel3" runat="server"></asp:Panel>
            <asp:Panel ID="Panel4" runat="server"></asp:Panel>
            <asp:Panel ID="Panel5" runat="server"></asp:Panel>         
            <thead class="thead-dark">
            <tr>
              <th scope="col">Mã sản phẩm</th>
              <th scope="col">Tên sản phẩm</th>
              <th scope="col">Phân loại</th>
              <th scope="col">Đơn vị</th>
              <th scope="col">Giá</th>
              <th scope="col">Ghi chú</th>
              <th scope="col">Tác vụ</th>
            </tr>
          </thead>
          <tbody id="divchua">
              <script type="text/javascript">
                  const sanpham = {};
                  window.onload = function () {
                      loadweb();
                  };
                  const VND = new Intl.NumberFormat('vi-VN', {
                      style: 'currency',
                      currency: 'VND',
                  });
                  function loadweb() {
                      PageMethods.set_path("Default.aspx");
                      PageMethods.LoadDB(onLoadSuccess, onFail);
                  }                  
                  function onLoadSuccess(result) {
                      var b ="";
                      result.forEach((item, index) => {
                          sanpham[item.id] = item.name;
                          b+='<tr><td>' + item.id + '</td>' +
                              '<td>' + item.name + '</td>';
                          if (item.type == 1) {
                              b = b + '<td>Hàng tiêu dùng</td>';
                          }
                          else {
                              b = b + '<td>Hàng công nghiệp</td>';
                          }
                          if (item.donvi == 1) {
                              b = b + '<td>Cái</td>';
                          }
                          else {
                              b = b + '<td>Lon</td>';
                          }
                          b = b + '<td>' + VND.format(item.price) + '</td>' +
                              '<td>' + item.note + '</td>' +
                              '<td><button type = "button" class="btn btn-success" onclick="openEditPopup(' + item.id + ',' + item.type + ',' + item.donvi + ',' + item.price + ')" > Sửa sản phẩm</button >' +
                              '<button type="button" class="btn btn-danger" onclick="deleteprodute(' + item.id + ')">Xóa sản phẩm</button></tr>';
                      });
                      $("#divchua").html(b);
                  }
                  $("#Themsp").click(function () {
                      $("#popupContainer").show();
                  });
                  $("#nutdongthem1").click(function () {
                      $("#popupContainer").hide();
                  });
                  $("#nutdongthem").click(function () {
                      $("#popupContainer").hide();
                  });
                  $("#createProduct").click(function () {
                      var name = $('#name').val();
                      var price = $('#price').val();
                      var note = $('#note').val();
                      var type = $('#type').val();
                      var donvi = $('#donvi').val();
                      if (name === "" || price === "" || type === "" || donvi === "" || document.getElementById("type").selectedIndex == 0 || document.getElementById("donvi").selectedIndex == 0) {
                          alert("Vui lòng nhập đầy đủ thông tin.");
                      }
                      else {
                          if (isNaN(price)) {
                              alert("Giá tiền vui lòng nhập là số.");
                              $('#price').val("");
                          }
                          else if (price <= 0) {
                              alert("Vui lòng nhập giá tiền lớn hơn 0.");
                              $('#price').val("");
                          }
                          else {
                              if (note === "") {
                                  note = "Notthing";
                              }
                              const temp = {};
                              temp["id"] = 0;
                              temp["name"] = name;
                              temp["type"] = type;
                              temp["donvi"] = donvi;
                              temp["price"] = price;
                              temp["note"] = note;
                              PageMethods.set_path("Default.aspx");
                              PageMethods.PushDB(temp, onAddSuccess, onFail);
                              $("#popupContainer").hide();
                          }
                      }
                  });
                  $("#in").click(function () {
                      window.print();

                  });
                  function onAddSuccess(result) {
                      $('#name').val("");
                      $('#price').val("");
                      $('#note').val("");
                      document.querySelector('#type').value = 0;
                      document.querySelector('#donvi').value = 0;
                      alert("Thêm sản phẩm thành công.");
                      loadweb();
                  }
                  function openEditPopup(id, type, donvi, price) {
                      $('#editName').val(sanpham[id]);
                      $('#editPrice').val(price);
                      $('#editType').val(type);
                      $('#editDonvi').val(donvi);
                      $('#value').val(id);
                      var editPopup = new bootstrap.Modal(document.getElementById("editPopup"));
                      editPopup.show();
                  }
                  $("#saveProduct").click(function () {
                      var name = $('#editName').val();
                      var price = $('#editPrice').val();
                      var type = $('#editType').val();
                      var donvi = $('#editDonvi').val();
                      var id = $('#value').val();
                      var note = $('#editNote').val();
                      if (name === "" || price === "" || type === "" || donvi === "") {
                          alert("Vui lòng nhập đầy đủ thông tin.");
                      }
                      else {
                          if (isNaN(price)) {
                              alert("Giá tiền vui lòng nhập là số.");
                              $('#price').val("");
                          }
                          else if (price <= 0) {
                              alert("Vui lòng nhập giá tiền lớn hơn 0.");
                              $('#price').val("");
                          }
                          else {
                              let choice = confirm("Xác nhận thay đổi thông tin sản phẩm " + sanpham[id]);
                              if (choice == true) {
                                  if (note === "") {
                                      note = "Notthing";
                                  }
                                  const temp = {};
                                  temp["id"] = id;
                                  temp["name"] = name;
                                  temp["type"] = type;
                                  temp["donvi"] = donvi;
                                  temp["price"] = price;
                                  temp["note"] = note;
                                  PageMethods.set_path("Default.aspx");
                                  PageMethods.UpdateDB(temp, UpdateSuccess, onFail);
                              }                               
                          }
                      }
                  });
                  function UpdateSuccess(result) {
                      var popup = bootstrap.Modal.getInstance(document.getElementById("editPopup"));
                      popup.hide();
                      alert('Cập nhập sản phẩm thành công');
                      loadweb();
                  }
                  function deleteprodute(id) {
                      let choice = confirm("Xác nhận xóa " + sanpham[id]);
                      if (choice == true) {
                          PageMethods.set_path("Default.aspx");
                          PageMethods.DeleteProduct(id, onDeleteSuccess, onFail);
                      } 
                  }
                  function onDeleteSuccess(result) {
                      alert('Xóa sản phẩm thành công');
                      loadweb();
                  }

                  function onFail(error) {
                      alert('Not working!!!');
                      var popup = bootstrap.Modal.getInstance(document.getElementById("popupContainer"));
                      popup.hide();
                      var popup = bootstrap.Modal.getInstance(document.getElementById("editPopup"));
                      popup.hide();
                  }
              </script>
              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
          </tbody>
        </table>
        </div>
    </main>
</asp:Content>
