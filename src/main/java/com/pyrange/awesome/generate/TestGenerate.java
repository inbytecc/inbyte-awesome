package com.pyrange.awesome.generate;

import com.pyrange.awesome.model.ConfigModel;
import com.pyrange.awesome.model.GenerateInfo;
import com.pyrange.awesome.util.FreeMarkUtil;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * 测试代码生成
 *
 * @author : chenjw
 * @date: 2023-1-13
 **/
public class TestGenerate {

    public static void generate(ConfigModel configModel, GenerateInfo generateInfo) throws Exception {
        Map<String, Object> root = new HashMap<>(2);
        root.put("generateInfo", generateInfo);
        root.put("configModel", configModel);

        String testConstantPath = configModel.getProjectPath().replace("\\", "/")
                + "/src/test/java/"
                + configModel.getGroupId().replace(".", "/")
                + "/test/";
        File file = new File(testConstantPath + "TestConstant.java");
        if (!file.exists()) {
            FreeMarkUtil.generateFile(root, "test-constant.ftl", testConstantPath, "TestConstant.java");
        }

        FreeMarkUtil.generateFile(root, "test.ftl",
                configModel.getProjectPath() + "/src/test/java/" + generateInfo.getControllerPackageWithSlash(),
                generateInfo.getModuleName() + "Test.java");
    }
}
