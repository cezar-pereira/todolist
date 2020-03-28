const addTaskMutation = r'''
                            mutation addTask($title: String, $hour: String, $minutes: String, $day: String, $month: String, 
                                             $category: String, $category_id: uuid, $importance: Int, $description: String) {
                              insert_tasks(objects: {title: $title, hour: $hour, minutes: $minutes, day: $day, month: $month, 
                                                     category: $category, category_id: $category_id, importance: $importance, 
                                                     description: $description, done: false}) {
                                affected_rows
                              }
                            }
                            ''';

const checkForTaskQuery = r'''
                                    query checkForTaskUpdate($categoryId: uuid, $taskId: uuid, $taskTitle: String) {
                                      categorys(where: {id: {_eq: $categoryId}, _and: {tasks: {_and: {id: {_neq: $taskId}, _and: {title: {_eq: $taskTitle}}}}}}) {
                                        id
                                      }
                                    }
                                ''';

const deleteTaskMutation = r'''
                                mutation deleteCategoryMutatio ($id : uuid){
                                  delete_categorys(where: {id: {_eq: $id}}) {
                                    affected_rows
                                  }
                                }
                                ''';

const updateTaskMutation = r'''
                                mutation updateTask($id: uuid, $title: String, $hour: String, $minutes: String, $day: String, 
                                $month: String, $category: String, $category_id: uuid, $importance: Int, $description: String, 
                                $done: Boolean) {
                                  update_tasks(where: {id: {_eq: $id}}, _set: {title: $title, hour: $hour, minutes: $minutes, 
                                  day: $day, month: $month, category: $category, category_id: $category_id, importance: $importance, 
                                  description: $description, done: $done}) {
                                    affected_rows
                                  }
                                }
                                ''';