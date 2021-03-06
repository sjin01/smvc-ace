package net.sjin.smvc.service.oa.impl;

import net.sjin.smvc.api.oa.Officialdocument;
import net.sjin.smvc.api.oa.OfficialdocumentMonitor;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.oa.OfficialdocumentMonitorService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 12/18  11:56
 *
 * @author: guanshj QQ: 928990049
 */
@Service("officialdocumentMonitorService")
public class OfficialdocumentMonitorServiceImpl extends BaseServiceImpl<OfficialdocumentMonitor> implements OfficialdocumentMonitorService   {

    @Override
    public String getNamespace() {
        return "OfficialdocumentMonitor";
    }

    @Override
    public List<Officialdocument> selectOfficialdocumentByMonitor(OfficialdocumentMonitor monitor) throws Exception {
        return (List<Officialdocument>) sqlSessionTemplate.selectList(getNamespace() + ".selectOfficialdocumentByMonitor_page",monitor);
    }

    @Override
    public void deleteSelective(OfficialdocumentMonitor monitor) throws Exception {
        sqlSessionTemplate.delete( getNamespace() + ".deleteSelective" , monitor);
    }
}
