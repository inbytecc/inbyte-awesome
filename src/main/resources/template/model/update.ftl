package ${generateInfo.modelPackage}.${generateInfo.moduleNameWithDot};

import lombok.Getter;
import lombok.Setter;
<#list generateInfo.importList as import>
import ${import};
</#list>
import com.alibaba.fastjson2.JSONArray;
import org.hibernate.validator.constraints.Length;


/**
 * ${generateInfo.tableComment}修改
 *
 * @author ${generateInfo.author}
 * @date ${generateInfo.date}
 **/
@Getter
@Setter
public class ${generateInfo.moduleName}Update {

<#list generateInfo.columnList as column>
    <#if "${column.columnCamelName}"?matches("deleted|isDel|isDelete|isDeleted|createUserName|createUserId|createTime|updateUserName|updateUserId|updateTime")>
    <#else>
    /** ${column.columnComment} */
        <#if column.columnJavaTypeName == 'String'>
    @Length(max = ${column.characterMaximumLength}, message = "${column.columnComment}长度不能超过${column.characterMaximumLength}位")
        </#if>
    private ${column.columnJavaTypeName} ${column.columnCamelName};

    </#if>
</#list>
}
