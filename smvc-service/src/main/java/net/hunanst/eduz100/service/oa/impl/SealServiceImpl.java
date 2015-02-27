package net.hunanst.eduz100.service.oa.impl;

import net.hunanst.eduz100.api.oa.Seal;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.oa.SealService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 1/22  9:31
 *
 * @author: guanshj QQ: 928990049
 */
@Service("sealService")
public class SealServiceImpl extends BaseServiceImpl<Seal> implements SealService {



    @Override
    public String getNamespace() {
        return "Seal";
    }


    @Override
    public List<Seal> selectSealByUserid(Integer userid) throws Exception {
        Seal seal = new Seal();
        seal.setUserid(userid);
        seal.setiDisplayStart(0);
        seal.setiDisplayLength(100);
        return (List<Seal>) sqlSessionTemplate.selectList( getNamespace()+".select_page" , seal);
    }
}
