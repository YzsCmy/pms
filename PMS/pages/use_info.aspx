<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Frame.Master" AutoEventWireup="true" CodeBehind="use_info.aspx.cs" Inherits="PMS.pages.use_info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
            	<div class="callout callout-success">
            		<h4 class="">
                    	使用说明
	                </h4>
	                
            	</div>
			
                <ol class="breadcrumb bg-green myfont" style="margin-right: 10px;padding-top: 20px;">
	                    <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i><font color="white">首页</font></a></li>
	                    <li class="active"><font color="white">使用说明</font></li>
	                    
	                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">


				<div class="outdiv">
					<h4 style="font-weight: bold;">信息查询</h4>
					<div class="innerdiv">
						<h6>查询员工信息</h6>
						 <h6>查询部门信息</h6>
						<span id="" class="text-info">
							注：信息查询可基于单条件查询也可基于多条件复合查询。
						</span>
					</div>
				</div>
				 
				 <div class="outdiv">
				 	<h4 style="font-weight: bold;">信息录入</h4>
				 	<div class="innerdiv">
				 		<h6>录入员工信息</h6>
						<h6>录入部门信息</h6>
						<span class="text-info">
							注：信息录入时，需要考虑数据信息的完整性、有效性等
						</span> 
				 	</div>
					
				 </div>
				
				 
			<div class="outdiv">
				 	<h4 style="font-weight: bold;">信息删除</h4>
				 	<div class="innerdiv">
				 		<h6>删除员工信息</h6>
						<h6>删除部门信息</h6>
						<span class="text-info">
							注：可单条记录删除，也可批量删除，执行该项操作时需要考虑删除所需的约束条件。
						</span> 
				 	</div>
					
			</div>
				
				 
				 
				
				
					<div class="outdiv">
				 	<h4 style="font-weight: bold;">信息修改</h4>
				 	<div class="innerdiv">
				 		<h6>修改员工信息</h6>
						<h6>修改部门信息</h6>
						<span class="text-info">
				注：进行修改操作时，需要保证数据的一致性
						</span> 
				 	</div>
					
			</div>
				
				 
				 
				
					<div class="outdiv">
				 	<h4 style="font-weight: bold;">信息浏览</h4>
				 	<div class="innerdiv">
				 		<h6>浏览个别员工信息</h6>
						<h6>浏览部门所属所有员工信息</h6>
						<span class="text-info">
						</span> 
				 	</div>
					
			</div>
				
				 
				 
				 
				 
				 	<div class="outdiv">
				 	<h4 style="font-weight: bold;">数据报表</h4>
				 	<div class="innerdiv">
				 		<h6>打印个别员工信息</h6>
						<h6>打印部门所属所有员工信息</h6>
						<span class="text-info">
	注：按照一定的格式在相应的窗口界面上显示用户、部门等信息，并提供通过打印机打印输出的功能。						</span> 
				 	</div>
					
			</div>
				
				 
				 
				
				
					<div class="outdiv">
				 	<h4 style="font-weight: bold;">用户权限</h4>
				 	<div class="innerdiv">
				 		<h6>普通用户</h6>
						<h6>管理员</h6>
						<span class="text-info">
							注：角色1为普通用户，角色2为管理员，普通用户具有登录，浏览，查询权限,没有录入，编辑，删除权限，管理员具有所有权限
						</span> 
				 	</div>
					
			</div>
				
					<div class="outdiv">
				 	<h4 style="font-weight: bold;">系统帮助及使用说明功能模块</h4>
				 	<div class="innerdiv">
				 		<h6>使用说明</h6>
						<span class="text-info">
							为用户提供必要的在线帮助功能和简要的操作使用说明。
						</span> 
				 	</div>
					
			</div>

            </section>
</asp:Content>
