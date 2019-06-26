<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUD.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvStudents" runat="server" 
                AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ID" ShowHeaderWhenEmpty="true"
                onRowCommand="gvStudents_RowCommand" OnRowEditing="gvStudents_RowEditing" OnRowCancelingEdit="gvStudents_RowCancelingEdit" OnRowDeleting="gvStudents_RowDeleting" 
                OnRowUpdating="gvStudents_RowUpdating"
                CellPadding="4" ForeColor="#333333" GridLines="None" Height="269px" Width="211px" style="margin-bottom: 0px">

                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

                <Columns>

                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtID" Text='<%# Eval("ID") %>' runat="server" />
                        </EditItemTemplate>
                       
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Name") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" Text='<%# Eval("Name") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Father's Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Father") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFather" Text='<%# Eval("Father") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFatherFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mother's Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Mother") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMother" Text='<%# Eval("Mother") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMotherFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Age">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Age") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAge" Text='<%# Eval("Age") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAgeFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Class">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Class") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtClass" Text='<%# Eval("Class") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtClassFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="School's Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("School") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSchool" Text='<%# Eval("School") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtSchoolFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/icons/edit.png" CommandName="Edit" tooltip="Edit" height="20px" width="20px" runat="server"/>
                            <asp:ImageButton ImageUrl="~/icons/delete.png" CommandName="Delete" tooltip="Delete" height="20px" width="20px" runat="server"/>                    
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/icons/update.png" CommandName="Update" tooltip="Update" height="20px" width="20px" runat="server"/>
                            <asp:ImageButton ImageUrl="~/icons/cancel.png" CommandName="Cancel" tooltip="Cancel" height="20px" width="20px" runat="server"/>
                         
                        </EditItemTemplate>

                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/icons/new.png" CommandName="AddNew" tooltip="Add" height="20px" width="20px" runat="server"/>
                           
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="lblSuccessMessage" Text="" runat="server" Forecolor="Green"/>
            <br />
            <asp:Label ID="lblErrorMessage" Text="" runat="server" Forecolor="Red"/>

        </div>
    </form>
</body>
</html>
