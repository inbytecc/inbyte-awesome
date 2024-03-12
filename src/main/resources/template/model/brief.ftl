package ${generateInfo.modelPackage}.${generateInfo.moduleNameWithDot};

import lombok.Getter;
import lombok.Setter;
<#list generateInfo.importList as import>
import ${import};
</#list>
import com.alibaba.fastjson2.JSONArray;

/**
 * ${generateInfo.tableComment}摘要
 *
 * @author ${generateInfo.author}
 * @date ${generateInfo.date}
 **/
@Getter
@Setter
public class ${generateInfo.moduleName}Brief {

<#list generateInfo.columnList as column>
    <#if "${column.columnCamelName}"?matches("${generateInfo.ignoredColumns}")>
    <#else>
    /** ${column.columnComment} */
    private ${column.columnJavaTypeName} ${column.columnCamelName};

    </#if>
</#list>
}
