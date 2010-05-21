/*
 * (C) Copyright 2010 Nuxeo SAS (http://nuxeo.com/) and contributors.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the GNU Lesser General Public License
 * (LGPL) version 2.1 which accompanies this distribution, and is available at
 * http://www.gnu.org/licenses/lgpl.html
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * Contributors:
 *     Nuxeo - initial API and implementation
 */

package org.nuxeo.apidoc.introspection;

import org.nuxeo.apidoc.api.BaseNuxeoArtifact;
import org.nuxeo.apidoc.api.ComponentInfo;
import org.nuxeo.apidoc.api.ServiceInfo;

public class ServiceInfoImpl extends BaseNuxeoArtifact implements ServiceInfo {

    protected final String serviceClassName;

    protected final ComponentInfo component;

    public ServiceInfoImpl(String serviceClassName, ComponentInfo component) {
        this.serviceClassName = serviceClassName;
        this.component = component;
    }

    @Override
    public String getId() {
        return serviceClassName;
    }

    public String getArtifactType() {
        return TYPE_NAME;
    }

    public String getVersion() {
        return component.getVersion();
    }

    public String getComponentId() {
        return component.getId();
    }

    public String getHierarchyPath() {
        return component.getHierarchyPath() + "/" + this.getId();
    }


}
