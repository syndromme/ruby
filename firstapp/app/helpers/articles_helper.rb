module ArticlesHelper
  #private
  #def list_articles
    #str="<table> <tr> <td> Title </td> <td> Body </td> <td> CRUD </td> <ul>"
    #Article.all.each do |article|
      #str += "<tr> <td> <li>#{article.title} </td> <td> #{article.body} </li> </td> <td><a href=/articles/show/id=#{article.id}> Show </a>|<a href=/articles/edit> Edit </a>|<a href=/articles/delete> Delete </a></td>"
    #end
    #return str += "</tr> </ul> </table>"
  #end
end
