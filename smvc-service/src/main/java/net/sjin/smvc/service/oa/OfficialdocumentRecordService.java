package net.sjin.smvc.service.oa;


import net.sjin.smvc.api.oa.Officialdocument;
import net.sjin.smvc.api.oa.OfficialdocumentRecord;
import net.sjin.smvc.service.BaseService;

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