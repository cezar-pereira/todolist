const getAllCategorysSubscription = r'''
                                      subscription getAllRepositories {
                                        categorys (order_by: {name: asc}){
                                          id
                                          name
                                          codePointIcon
                                          tasks (order_by: {done: asc, importance: asc}){
                                            id
                                            title
                                            hour
                                            minutes
                                            day
                                            month
                                            category
                                            category_id
                                            importance
                                            description
                                            done
                                          }
                                        }
                                      }
                                      ''';

const addCategoryMutation = r'''
                            mutation addCategory($name: String, $codePointIcon: Int) {
                              insert_categorys(objects: {name: $name, codePointIcon: $codePointIcon}) {
                                affected_rows
                              }
                            }
                            ''';

const checkForCategoryQuery = r'''
                              query checkForCategory($name: String, $id: uuid) {
                                  categorys(where: {name: {_eq: $name}, _and: {id: {_neq: $id}}}) {
                                    id
                                  }
                              }
                              ''';

const deleteCategoryMutation = r'''
                                mutation deleteCategoryMutatio ($id : uuid){
                                  delete_categorys(where: {id: {_eq: $id}}) {
                                    affected_rows
                                  }
                                }
                                ''';

const updateCategoryMutation = r'''
                                mutation updateCategoryMutatio($id: uuid, $name: String, $codePointIcon: Int) {
                                  update_categorys(where: {id: {_eq: $id}}, _set: {codePointIcon: $codePointIcon, name: $name}) {
                                    affected_rows
                                  }
                                }
                                ''';
