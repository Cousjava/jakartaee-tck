/*
 * Copyright (c) 2007, 2018 Oracle and/or its affiliates. All rights reserved.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License v. 2.0, which is available at
 * http://www.eclipse.org/legal/epl-2.0.
 *
 * This Source Code may also be made available under the following Secondary
 * Licenses when the conditions for such availability set forth in the
 * Eclipse Public License v. 2.0 are satisfied: GNU General Public License,
 * version 2 with the GNU Classpath Exception, which is available at
 * https://www.gnu.org/software/classpath/license.html.
 *
 * SPDX-License-Identifier: EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0
 */

/*
 * $Id$
 */

// This class was generated by the JAXRPC RI, do not edit.
// Contents subject to change without notice.
// JAX-RPC Reference Implementation (1.1, build EA-R15)

package com.sun.ts.tests.jaxrpc.ee.wsi.document.literal.marshalltest;

public class FooIntEnumType implements java.io.Serializable {
  private int value;

  public static final int _value1 = (int) 1;

  public static final int _value2 = (int) 2;

  public static final int _value3 = (int) 3;

  public static final FooIntEnumType value1 = new FooIntEnumType(_value1);

  public static final FooIntEnumType value2 = new FooIntEnumType(_value2);

  public static final FooIntEnumType value3 = new FooIntEnumType(_value3);

  protected FooIntEnumType(int value) {
    this.value = value;
  }

  public int getValue() {
    return value;
  }

  public static FooIntEnumType fromValue(int value)
      throws java.lang.IllegalStateException {
    if (value1.value == value) {
      return value1;
    } else if (value2.value == value) {
      return value2;
    } else if (value3.value == value) {
      return value3;
    }
    throw new IllegalArgumentException();
  }

  public static FooIntEnumType fromString(String value)
      throws java.lang.IllegalStateException {
    if (value.equals("1")) {
      return value1;
    } else if (value.equals("2")) {
      return value2;
    } else if (value.equals("3")) {
      return value3;
    }
    throw new IllegalArgumentException();
  }

  public String toString() {
    return new Integer(value).toString();
  }

  public boolean equals(Object obj) {
    if (!(obj instanceof FooIntEnumType)) {
      return false;
    }
    return ((FooIntEnumType) obj).value == value;
  }

  public int hashCode() {
    return new Integer(value).toString().hashCode();
  }
}
