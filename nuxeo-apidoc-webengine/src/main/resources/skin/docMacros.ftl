<#macro docContent docItem>
  <div class="docContent">
    <#if docItem.renderingType=='html'>
        ${docItem.content}
    </#if>
    <#if docItem.renderingType=='wiki'>
        <@wiki>${docItem.content}</@wiki>
    </#if>
      <#if docItem.applicableVersion??>
        <#if ((docItem.applicableVersion?size)>0) >
        <div class="docVersionDisplay">
          <ul>
          <#list docItem.applicableVersion as version>
            <li>${version}</li>
          </#list>
          </ul>
        </div>
        </#if>
      </#if>

    <#assign attachements=docItem.attachements>
    <#if attachements??>
      <#assign attachementKeys=attachements?keys>
      <#list attachementKeys as attachementName>
       <div class="attachementTitle">${attachementName}</div>
       <div class="attachementContent">
       <pre><code>
       ${attachements[attachementName]?html}
       </code></pre>
       </div>
    </#list>
</#if>

  </div>
</#macro>

<#macro viewAdditionnalDoc docsByCat>
  <#assign categories=docsByCat?keys/>
  <#if ((categories?size)>1)>
    <div class="additionnalDocs"> Additionnal documentation <br/>
    <table>
    <tr>
    <#list categories as category>

     <#if !(category=="Description")>
       <td class="catHeader">
       ${category}
       </td>
       <td>
       <ul>
       <#list docsByCat[category] as docItem>
          <li><A href="javascript:showAddDoc('${docItem.id}')">${docItem.title}</A> </li>
       </#list>
       </ul>
       </td>
       <td>&nbsp;
       </td>
   </#if>
    </#list>
    </tr>
    </table>

    <#list categories as category>
     <#list docsByCat[category] as docItem>
        <div class="additionnalDocPannel hiddenDocPanel" id="${docItem.id}">
        <A name="${docItem.id}"> ${docItem.title} </A>
          <@docContent docItem/>
        </div>
     </#list>
    </#list>

    </div>
  </#if>
</#macro>