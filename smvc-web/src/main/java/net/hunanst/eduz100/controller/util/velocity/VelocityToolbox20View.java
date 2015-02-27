package net.hunanst.eduz100.controller.util.velocity;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.context.Context;
import org.apache.velocity.tools.Scope;
import org.apache.velocity.tools.ToolManager;
import org.apache.velocity.tools.view.ViewToolContext;
import org.springframework.web.servlet.view.velocity.VelocityToolboxView;

/**
 * Created with IntelliJ IDEA.
 * User: Mr.Jz
 * Date: 14-4-15
 * Time: 上午11:44
 * To change this template use File | Settings | File Templates.
 */
public class VelocityToolbox20View extends VelocityToolboxView {
    @Override
    protected Context createVelocityContext(Map<String, Object> model,
                                            HttpServletRequest request, HttpServletResponse response)
            throws Exception {// Create a
        // ChainedContext
        // instance.
        ViewToolContext ctx;

        ctx = new ViewToolContext(getVelocityEngine(), request, response,
                getServletContext());

        ctx.putAll(model);

        if (this.getToolboxConfigLocation() != null) {
            ToolManager tm = new ToolManager();
            tm.setVelocityEngine(getVelocityEngine());
            tm.configure(getServletContext().getRealPath(
                    getToolboxConfigLocation()));
            if (tm.getToolboxFactory().hasTools(Scope.REQUEST)) {
                ctx.addToolbox(tm.getToolboxFactory().createToolbox(
                        Scope.REQUEST));
            }
            if (tm.getToolboxFactory().hasTools(Scope.APPLICATION)) {
                ctx.addToolbox(tm.getToolboxFactory().createToolbox(
                        Scope.APPLICATION));
            }
            if (tm.getToolboxFactory().hasTools(Scope.SESSION)) {
                ctx.addToolbox(tm.getToolboxFactory().createToolbox(
                        Scope.SESSION));
            }
        }
        return ctx;
    }
}