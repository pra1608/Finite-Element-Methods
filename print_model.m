fprintf(fid, ' ******* PRINTING MODEL DATA **************\n\n\n');

% Print Nodal coordinates
%
fprintf(fid, '------------------------------------------------------ \n');
fprintf(fid, 'Number of nodes:                                 %g\n', nnd );  
fprintf(fid, 'Number of elements:                              %g\n', nel ); 
fprintf(fid, 'Number of nodes per element:                     %g\n', nne ); 
fprintf(fid, 'Number of degrees of freedom per node:           %g\n', nodof); 
fprintf(fid, 'Number of degrees of freedom per element:        %g\n\n\n', eldof); 
%
%
%
fprintf(fid, '------------------------------------------------------ \n');
fprintf(fid, 'Node        X        Y\n');
for i=1:nnd
fprintf(fid,' %g,      %07.2f,      %07.2f\n',i, geom(i,1),geom(i,2));
end
fprintf(fid,'\n');
%
% Print element connectivity
%
fprintf(fid, '------------------------------------------------------ \n');
fprintf(fid, 'Element      Node_1      Node_2     Node_3      Node_4\n');
for i=1:nel
fprintf(fid,'    %g,         %g,          %g,         %g,       %g\n',i, connec(i,1), connec(i,2), connec(i,3),connec(i,4));
end
fprintf(fid,'\n');

% Print Nodal freedom
%
fprintf(fid, '------------------------------------------------------ \n');
fprintf(fid, '-------------Nodal freedom---------------------------- \n');
fprintf(fid, 'Node      disp_x      disp_y\n');
for i=1:nnd
fprintf(fid,'  %g,         %g,         %g\n',i, nf(i,1),nf(i,2));
end
fprintf(fid,'\n');
%
% Print Nodal loads
%
fprintf(fid, '------------------------------------------------------ \n');
fprintf(fid, '-----------------Applied Nodal Loads------------------- \n');
fprintf(fid, 'Node        load_X         load_Y\n');
for i=1:nnd
    for j=1:nodof
        node_force(i,j) = 0;
        if nf(i,j)~= 0;
        node_force(i,j) = fg(nf(i,j)) ;
        end
    end    
fprintf(fid,'  %g,        %07.2f,        %07.2f\n',i, node_force(i,1),node_force(i,2));
end
%
fprintf(fid, '------------------------------------------------------ \n');
fprintf(fid,'\n');
fprintf(fid,'Total number of active degrees of freedom, n = %g\n',n);
fprintf(fid,'\n');
%mo