/*********************** setTableColor.js ***********************************/

 function setRowColor(oTable,oddClass,evenClass)
 {
     resetTableColor(oTable);
     for(var i=1; i<oTable.rows.length; i++)
     {
         if(i % 2 == 0)
             oTable.rows[i].className = evenClass;
         else
             oTable.rows[i].className = oddClass;
     }
 }

 function resetTableColor(oTable)
 {
     for(var i=1; i<oTable.rows.length; i++)
     {
         oTable.rows[i].className = "";
         for(var j=0; j<oTable.rows[i].cells.length; j++)
             oTable.rows[i].cells[j].className = "";
     }
 }
 /*********************** setTableColor.js ends!***********************************/
