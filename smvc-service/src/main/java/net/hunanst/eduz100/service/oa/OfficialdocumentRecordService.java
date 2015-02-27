package net.hunanst.eduz100.service.oa;


import net.hunanst.eduz100.api.oa.Officialdocument;
import net.hunanst.eduz100.api.oa.OfficialdocumentRecord;
import net.hunanst.eduz100.service.BaseService;

import java.util.List;

public interface OfficialdocumentRecordService extends BaseService<OfficialdocumentRecord> {

    /**
     * 个人 公文档案柜
     * @param record
     * @return
     * @throws Exception
     */
    List<Officialdocument> selectOfficialdocumentByRecordForUser (OfficialdocumentRecord record) throws Exception;

    /**
     * 部门 公文档案柜
     * @param record
     * @return
     * @throws Exception
     */
    List<Officialdocument> selectOfficialdocumentByRecordForOrg (OfficialdocumentRecord record) throws Exception;


}