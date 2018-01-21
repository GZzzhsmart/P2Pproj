package top.zzh.common;

import org.apache.commons.beanutils.PropertyUtils;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;

/**
 * 对象与对象深度拷贝，包括嵌套的复合类型，可以忽略类型，只要有相通的属性名
 * 数组也可以处理，即便dest是一个空数组
 *
 */
public class BeanUtils {

    /**
     *
     * @param dest 目标对象
     * @param orig 原始对象
     * @throws Exception
     */
    public static void copy(Object dest, Object orig) throws Exception {
        if (dest == null) {
            throw new IllegalArgumentException("No destination bean specified");
        }
        if (orig == null) {
            throw new IllegalArgumentException("No origin bean specified");
        }

        Class origClass = orig.getClass();
        Class destClass = dest.getClass();
        if (origClass == String.class || origClass.isPrimitive()) {
            dest = orig;
        }
        if(orig.getClass().isArray()){
            Object[] destArr = (Object[]) dest;
            Object[] origArr = (Object[]) orig;
            Class elemenClass = destArr.getClass().getComponentType();

            for(int i=0;i<origArr.length;i++){
                if(destArr[i]==null){
                    destArr[i] = elemenClass.newInstance();
                }

                copy(destArr[i], origArr[i]);
            }
        }
        String classLogInfo = "origClass:"+origClass.getName()+",destClass:"+destClass.getName()+",";
        PropertyDescriptor[] origDescriptors = PropertyUtils
                .getPropertyDescriptors(orig);
        for (int i = 0; i < origDescriptors.length; i++) {
            String name = origDescriptors[i].getName();
            if ("class".equals(name)) {
                continue;
            }
            Object value = null;
            if (PropertyUtils.isReadable(orig, name)
                    && PropertyUtils.isWriteable(dest, name)) {
                try {
                    value = PropertyUtils.getSimpleProperty(orig, name);
                    PropertyUtils.setSimpleProperty(dest, name, value);
                } catch (IllegalArgumentException e) {
                    // 类型不同
                    try {
                        PropertyDescriptor targetDescriptor = PropertyUtils
                                .getPropertyDescriptor(dest, name);
                        Object new_value = targetDescriptor.getPropertyType()
                                .newInstance();
                        copy(new_value, value);
//                      LOG.info(new_value);
                        PropertyUtils.setSimpleProperty(dest, name, new_value);
                    }catch(IllegalArgumentException e1){
                        //
                    }
                    catch (IllegalAccessException e1) {
                        throw e1;
                    } catch (InvocationTargetException e1) {
                        throw e1;
                    } catch (NoSuchMethodException e1) {
                        throw e1;
                    } catch (InstantiationException e1) {
                        throw e1;
                    }
                } catch (NoSuchMethodException e) {
                    throw e;
                } catch (IllegalAccessException e) {
                    throw e;
                } catch (InvocationTargetException e) {
                    throw e;
                }
            }
        }
    }
}
