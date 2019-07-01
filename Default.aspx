<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="CRUD.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
  
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
  
            <asp:GridView ID="gvStudents" runat="server" 
                AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="ID" ShowHeaderWhenEmpty="True"
                onRowCommand="gvStudents_RowCommand" OnRowEditing="gvStudents_RowEditing" OnRowCancelingEdit="gvStudents_RowCancelingEdit" OnRowDeleting="gvStudents_RowDeleting" 
                OnRowUpdating="gvStudents_RowUpdating"
                CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="269px" Width="211px" style="margin-bottom: 0px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">

                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />

                <Columns>

                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                                          
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Name") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" Text='<%# Eval("Name") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNameFooter" placeholder="Name" runat="server" />
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
                            <asp:TextBox ID="txtFatherFooter" placeholder="Father's Name" runat="server" />
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
                            <asp:TextBox ID="txtMotherFooter" placeholder="Mother's Name" runat="server" />
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
                            <asp:TextBox ID="txtAgeFooter" placeholder="Age" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106 || (event.keyCode >= 48 && event.keyCode <= 57 && isNaN(event.key))) && event.keyCode!=32);" runat="server" />
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
                            <asp:DropDownList ID="ddlClassFooter" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:TextBox ID="txtClassFooter" placeholder="Class" runat="server" />--%>
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
                            <asp:TextBox ID="txtSchoolFooter" placeholder="School's Name" runat="server" />
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

    </asp:Content>


