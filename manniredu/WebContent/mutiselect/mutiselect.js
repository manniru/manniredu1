 function selectIngredient1(select)
   {
     var option = select.options[select.selectedIndex];
     var ul = select.parentNode.getElementsByTagName('ul')[0];
     
     var choices = ul.getElementsByTagName('input');
     for (var i = 0; i < choices.length; i++)
       if (choices[i].value == option.value)
         return;
     
     var li = document.createElement('li');
     var input = document.createElement('input');
     var text = document.createTextNode(option.firstChild.data);
     
     input.type = 'hidden';
     input.value = option.value;
     
     li.appendChild(input);
     li.appendChild(text);
     li.setAttribute('onclick', 'this.parentNode.removeChild(this);');     
     
     ul.appendChild(li);
   }
   
   function courses1(select)
   {
     var $ul = $(select).prev('ul');
     
     if ($ul.find('input[value=' + $(select).val() + ']').length == 0)
       $ul.append('<li onclick="$(this).remove();">' +
         '<input type="hidden" name="courses1[]" value="' + 
         $(select).val() + '" /> ' + $(select).find('option[selected]').text() + '</li>');
   }
   
   function courses2(select)
   {
     var $ul = $(select).prev('ul');
     
     if ($ul.find('input[value=' + $(select).val() + ']').length == 0)
       $ul.append('<li onclick="$(this).remove();">' +
         '<input type="hidden" name="courses2[]" value="' + 
         $(select).val() + '" /> ' + $(select).find('option[selected]').text() + '</li>');
   }