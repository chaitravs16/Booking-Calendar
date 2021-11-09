<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="ClinicalLabs.Appointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appointment</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
   <link rel="stylesheet" type="text/css" href="css/style.css">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
   <style type="text/css">
       .my{
          margin-top: -100px;
       }
   </style>
</head>
<body >
    <!--navbar start-->
   <nav class="navbar navbar-expand-sm my-nav sticky-top large">
      <div class="container my-navbar">
      <a href="index.html" class="navbar-brand"><font style="color:#3c97e8;">PHOTOGRAPHER</font><font style="color:#69cb6a"> BOOKING.</font></a>
      <ul class="navbar-nav">
        <%-- <li class="nav-item"><a href="Home.aspx" class="nav-link active"><i class="fa fa-home"></i>&nbsp;HOME</a></li>--%>
         <li class="nav-item"><a href="Appointment.aspx" class="nav-link"><i class="fa fa-home"></i>&nbsp;BOOKING</a></li>
      </ul>
       </div>       
   </nav>
   <!--navbar end-->
   <!--banner start-->
   <div class="banner">
         <img src="images/appointment.jpg">
         <div class="centered">

            <h1 class="text-center" style="margin-top:150px;">Booking Calendar</h1><p class="text-center" style="font-size: 22px;">Make booking online to save your precious time.<br>> Photographers\Booking Calendar</p>
       <!--     <div class="btn-group" role="group" aria-lable="Login / Signup">
                 <button type="button" class="btn login_btn1"><i class="fa fa-user"></i>&nbsp;Login</button>
                 <button type="button" class="btn login_btn2"><i class="fa fa-sign-in-alt"></i>&nbsp;SignUp</button>
         </div>-->
         </div>
   </div>
   <!--banner end-->

  <!--forms start-->
  <div class="my-container" style="margin-top: 60px; "> 
    <form id="AppointmentForm" runat="server">

         <label class="my">Date:</label>
        <center> <strong>
        <asp:Calendar ID="Calendar1" runat="server"  AutoPostBack="False" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" OnDayRender="Calendar1_DayRender" ShowNextPrevMonth="True" Width="350px" BorderStyle="Solid" NextPrevFormat="ShortMonth" >
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#333333" Font-Bold="True" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" BorderColor="#66FF33" HorizontalAlign="Center" ForeColor="White" />
            <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" BorderColor="Black" BorderWidth="4px" />
            <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
            </strong> </center>


         <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="Label"></asp:Label>
         <br />

        <div class="form-group">
         <label class="my">Time:</label><br/>
         <%--<asp:DropDownList ID="DropDownList1" runat="server" Height="42px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="650px">
            <asp:ListItem>09 : 00 AM to 11:00 AM</asp:ListItem>
            <asp:ListItem>11 : 00 AM to 01:00 PM</asp:ListItem>
            <asp:ListItem>01 : 00 PM to 03:00 PM</asp:ListItem>
            <asp:ListItem>03 : 00 PM to 05:00 PM</asp:ListItem>
            <asp:ListItem>05 : 00 PM to 07 : 00 PM</asp:ListItem>

        </asp:DropDownList>--%>
         <asp:TextBox ID="TextBox5" runat="server" class="form-control" PlaceHolder="Start Time (08:00:00)"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter Start Time!!" ForeColor="Red" Font-Bold="true" SetFocusOnError="True" Display="Dynamic" ValidationGroup="Booking"></asp:RequiredFieldValidator>
            <br/>
         <asp:TextBox ID="TextBox6" runat="server" class="form-control" PlaceHolder="End Time (16:00:00)"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox6" ErrorMessage="Enter End Time!!" ForeColor="Red" Font-Bold="true" SetFocusOnError="True" Display="Dynamic" ValidationGroup="Booking"></asp:RequiredFieldValidator>
        <br/>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Red" Text="Label"></asp:Label><br/>
       </div>
         
         <div class="form-group">
              <label class="my">Phtographer:</label>
              <asp:DropDownList ID="ddlPhotographer" runat="server" Height="42px" Width="650px">
        </asp:DropDownList>
              <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlPhotographer" ErrorMessage="Select Photographer!!" ForeColor="Red" Font-Bold="true" SetFocusOnError="True" InitialValue="0" Display="Dynamic" ValidationGroup="Booking"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
              <label class="my">First Name:</label>
              <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter First Name!!" ForeColor="Red" Font-Bold="true" SetFocusOnError="True" Display="Dynamic" ValidationGroup="Booking"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="REV" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Valid Name!!" ForeColor="Red" Font-Bold="true" ValidationExpression="^[A-Za-z ]*$" SetFocusOnError="True" Display="Dynamic" ValidationGroup="Booking"></asp:RegularExpressionValidator>
        </div>
        
        <div class="form-group">
              <label class="my">Last Name:</label>
              <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>  
              <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter Last Name!!" ForeColor="Red" Font-Bold="true" SetFocusOnError="True" Display="Dynamic" ValidationGroup="Booking"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter Valid Name!!" ForeColor="Red" Font-Bold="true" SetFocusOnError="True" ValidationExpression="^[A-Za-z ]*$" Display="Dynamic" ValidationGroup="Booking"></asp:RegularExpressionValidator>
        </div>
        
        <div class="form-group">
              <label class="my">E-Mail:</label>
              <asp:TextBox ID="TextBox3" runat="server" type="email" class="form-control"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter Email!!" SetFocusOnError="True" ForeColor="Red" Font-Bold="true" Display="Dynamic" ValidationGroup="Booking"></asp:RequiredFieldValidator>
        </div>
        
        <div class="form-group">
              <label class="my">Phone:</label>
              <asp:TextBox ID="TextBox4" runat="server" class="form-control"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter Phone Number!!" SetFocusOnError="True" ForeColor="Red" Font-Bold="true" Display="Dynamic" ValidationGroup="Booking"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" SetFocusOnError="True" ErrorMessage="Enter Valid 10-digit Number!!" ForeColor="Red" Font-Bold="true" ValidationExpression="^[0-9]{10,10}" Display="Dynamic" ValidationGroup="Booking"></asp:RegularExpressionValidator>
        </div>

        <asp:Label ID="Label17" runat="server" Text="Label" Font-Bold="True" ForeColor="#66FF33" Font-Size="X-Large"></asp:Label>

         <br />

       <asp:Button ID="Button1" runat="server" Text="Check Availability" class="btn btn-success" OnClick="Button1_Click"  ValidationGroup="Booking" />
        
        &nbsp;&nbsp;
        
        <input id="Butt" type="button" value="Book Appointment" runat="server" class="btn btn-success"  data-toggle="modal" data-target="#myModal"/>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView> 
        
        <!-- The Modal -->
     <div class="modal" id="myModal">
       <div class="modal-dialog">
         <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Booking Details..</h4>
        
      </div>

      <!-- Modal body -->
      <div class="modal-body">
          <table>
              <tr><td>
           <strong> <asp:Label ID="Label5" runat="server" Text="Name:" Font-Bold="True" Font-Size="Medium"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>
       <td>   <strong><asp:Label ID="Label6" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label></strong>
               </td> </tr>

              <tr>
          <td> <strong> <asp:Label ID="Label7" runat="server" Text="E-Mail Id:" Font-Bold="True" Font-Size="Medium"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>
         <td> <strong><asp:Label ID="Label8" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label></strong></td>
             </tr>
              
              <tr>
       <td>    <strong> <asp:Label ID="Label9" runat="server" Text="Phone:" Font-Bold="True" Font-Size="Medium"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>
         <td> <strong><asp:Label ID="Label10" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label></strong></td>
             </tr>
              <tr>
     <td>      <strong> <asp:Label ID="Label3" runat="server" Text="Photographer:" Font-Bold="True" Font-Size="Medium"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>
     <td>     <strong><asp:Label ID="Label4" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label></strong></td>
             </tr>
              <tr>
     <td>      <strong> <asp:Label ID="Label11" runat="server" Text="Date:" Font-Bold="True" Font-Size="Medium"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>
     <td>     <strong><asp:Label ID="Label12" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label></strong></td>
             </tr>
              
              <tr>
       <td>    <strong> <asp:Label ID="Label13" runat="server" Text="Time:" Font-Bold="True" Font-Size="Medium"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>
       <td>   <strong><asp:Label ID="Label14" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label></strong></td>
             </tr>
              
       
      </table>

      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
         
          <asp:Button ID="Button2" runat="server" Text="Confirm"  class="btn btn-success" OnClick="Button2_Click"/>
        <button type="button" class="btn btn-danger" data-dismiss="modal" runat="server" onclick="diss()">Edit</button>
      </div>

    </div>
  </div>
</div>
        
            
     </form>
   </div>
  <!--forms end-->
   <!--footer start-->
    <footer>
   	<div class="cop_harman" style="background-color:#2b3b4b; height: 60px;margin-top:20px; ">
          <p style="color: white; text-align: center; line-height: 60px;"> Copyright &copy; Chaitraa V Shetty | 2021 All rights reserved.</p>
   	</div>		
   </footer>
    <!--footer end-->

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<script type="text/javascript" src="js/popper.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
     <script>
         function diss() {
             document.getElementById("Butt").disabled = true;
             document.getElementById("Label17").textContent= "";
           
         }
	  </script>
</body>
</html>
