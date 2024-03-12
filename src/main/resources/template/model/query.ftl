package ${generateInfo.modelPackage}.${generateInfo.moduleNameWithDot};

import com.inbyte.commons.model.dto.BasePage;
import lombok.Getter;
import lombok.Setter;
import jakarta.validation.constraints.Pattern;

import java.time.LocalDate;

/**
 * ${generateInfo.tableComment}查询
 *
 * @author ${generateInfo.author}
 * @date ${generateInfo.date}
 **/
@Getter
@Setter
public class ${generateInfo.moduleName}Query extends BasePage {

    /**
     * 查询关键字
     **/
    private String keyword;

    /**
    * 开始日期
    */
    private LocalDate startDate;

    /**
    * 截止日期
    */
    private LocalDate endDate;

    /**
     * 排序字段
     **/
    @Pattern(regexp = "create_time|update_time|view_count|top|hidden", message = "排序字段不合法")
    private String orderColumn;

    /**
     * 升降序
     **/
    @Pattern(regexp = "asc|desc", message = "排序方式不合法")
    private String ordering;
}