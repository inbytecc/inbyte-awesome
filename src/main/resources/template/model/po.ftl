package ${generateInfo.modelPackage}.${generateInfo.moduleNameWithDot};

import lombok.*;
<#list generateInfo.importList as import>
import ${import};
</#list>

/**
 * ${generateInfo.tableComment}实体
 *
 * 表：${generateInfo.tableName}
 * @author ${generateInfo.author}
 * @date ${generateInfo.date}
 **/
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ${generateInfo.moduleName}Po {

    <#list generateInfo.columnList as column>
    /** ${column.columnComment} */
    private ${column.columnJavaTypeName} ${column.columnCamelName};

    </#list>
}
