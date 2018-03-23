function draw_quantity(coord,surf,U,Q_node,elem_type,...
                                    size_xy,size_z,size_hole)

% =========================================================================
%
%  This function depicts prescribed nodal quantity
%
%  input data:
%    coord - coordinates of the nodes, size(coord)=(3,n_n) where n_n is a
%            number of nodes
%    surf - n_p x n_s array containing numbers of nodes defining each
%           surface element, n_s = number of surface elements
%    U - nodal displacements, size(U)=(3,n_n) to catch deformed shape
%        if the deformed shape is not required then set 0*U
%    Q_node - prescribed nodal quantity, size(Q_node)=(1,n_n)
%    elem_type - the type of finite elements; available choices:
%                'P1', 'P2', 'Q1', 'Q2'
%    size_xy - size of the body in x and y direction (integer)
%    size_z  - size of the body in z-direction (integer) 
%    size_hole - size of the hole in the body (integer)
%                size_hole < size_xy
%         body=(0,size_xy)x(0,size_xy)x(0,size_z)\setminus
%              (0,size_hole)x(0,size_hole)x(0,size_z)
%
% ======================================================================
%

  figure;
  hold on;
  
  % visualization of the quantity
  if strcmp(elem_type,'P1')||strcmp(elem_type,'P2')
     s = patch('Faces',surf(1:3,:)','Vertices',coord'+U',...
        'FaceVertexCData',Q_node','FaceColor','interp','EdgeColor','none'); 
  else
     s = patch('Faces',surf(1:4,:)','Vertices',coord'+U',...
        'FaceVertexCData',Q_node','FaceColor','interp','EdgeColor','none'); 
  end
  alpha(s,.5);
  colorbar;
  
  % undeformed shape of the body
  plot3([size_hole,size_xy],[0,0],[0,0])
  plot3([size_hole,size_xy],[0,0],[size_z,size_z])
  plot3([0,size_xy],[size_xy,size_xy],[0,0])
  plot3([0,size_xy],[size_xy,size_xy],[size_z,size_z])
  plot3([0,size_hole],[size_hole,size_hole],[0,0])
  plot3([0,size_hole],[size_hole,size_hole],[size_z,size_z])
  plot3([0,0],[size_hole,size_xy],[0,0])
  plot3([0,0],[size_hole,size_xy],[size_z,size_z])
  plot3([size_hole,size_hole],[0,size_hole],[0,0])
  plot3([size_hole,size_hole],[0,size_hole],[size_z,size_z])
  plot3([size_xy,size_xy],[0,size_xy],[0,0])
  plot3([size_xy,size_xy],[0,size_xy],[size_z,size_z])
  plot3([0,0],[size_hole,size_hole],[0,size_z])
  plot3([0,0],[size_xy,size_xy],[0,size_z])
  plot3([size_hole,size_hole],[0,0],[0,size_z])
  plot3([size_hole,size_hole],[size_hole,size_hole],[0,size_z])  
  plot3([size_xy,size_xy],[0,0],[0,size_z])
  plot3([size_xy,size_xy],[size_xy,size_xy],[0,size_z])  
  
  %
  box on
  view(3);
  axis equal;
  hold off;
  axis off;
end