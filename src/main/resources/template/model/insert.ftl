package ${generateInfo.modelPackage}.${generateInfo.moduleNameWithDot};

import lombok.Getter;
import lombok.Setter;
<#list generateInfo.importList as import>
import ${import};
</#list>

import org.hibernate.validator.constraints.Length;
<#if basicConfig.jdkVersion == 17>
import jakarta.validation.constraints.NotNull;
<#else>
import javax.validation.constraints.NotNull;
</#if>
import com.alibaba.fastjson2.JSONArray;

/**
 * ${generateInfo.tableComment}创建
 *
 * @author ${generateInfo.author}
 * @date ${generateInfo.date}
 **/
@Getter
@Setter
public class ${generateInfo.moduleName}Insert {

<#list generateInfo.columnList as column>
    <#if generateInfo.primaryKey == column.columnName || "${column.columnCamelName}"?matches("${generateInfo.ignoredColumns}")>
    <#else>
    /** ${column.columnComment} */
        <#if column.nullable == 'NO'>
    @NotNull(message = "${column.columnComment}不能为空")
        </#if>
        <#if column.columnJavaTypeName == 'String'>
    @Length(max = ${column.characterMaximumLength}, message = "${column.columnComment}长度不能超过${column.characterMaximumLength}位")
        </#if>
    private ${column.columnJavaTypeName} ${column.columnCamelName};

    </#if>
</#list>
}
