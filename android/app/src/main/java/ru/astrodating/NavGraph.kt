package ru.astrodating

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavHostController
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import ru.astrodating.screens.ChatScreen
import ru.astrodating.screens.QuestionnaireScreen
import ru.astrodating.screens.part.Part10View
import ru.astrodating.screens.part.Part11View
import ru.astrodating.screens.part.Part12View
import ru.astrodating.screens.part.Part13View
import ru.astrodating.screens.part.Part14View
import ru.astrodating.screens.part.Part15View
import ru.astrodating.screens.part.Part16View
import ru.astrodating.screens.part.Part1View
import ru.astrodating.screens.part.Part2View
import ru.astrodating.screens.part.Part3View
import ru.astrodating.screens.part.Part4View
import ru.astrodating.screens.part.Part5View
import ru.astrodating.screens.part.Part6View
import ru.astrodating.screens.part.Part7View
import ru.astrodating.screens.part.Part8View
import ru.astrodating.screens.part.Part9View

@Composable
fun NavGraph(modifier: Modifier = Modifier) {
    val navController = rememberNavController()

    NavHost(navController = navController, startDestination = "login") {
        composable("login") {
            LoginScreen(navController = navController)
        }
        composable("register") {
            RegisterScreen(navController = navController)
        }
        composable("home") {
            UserListScreen(navController = navController)
        }
        composable("chat/{personName}",
            arguments = listOf(navArgument("personName") { type = NavType.StringType })) { backStackEntry ->
            ChatScreen(navController = navController, personName = backStackEntry.arguments?.getString("personName"))
        }
        composable("personDetail/{personName}",
            arguments = listOf(navArgument("personName") { type = NavType.StringType })) { backStackEntry ->
            PersonDetailScreen(navController = navController, personName = backStackEntry.arguments?.getString("personName"))
        }
        composable("questionnaire") {
            QuestionnaireScreen(navController = navController)
        }
        composable("part1") {
            Part1View(navController = navController)
        }
        composable("part2") {
            Part2View(navController = navController)
        }
        composable("part3") {
            Part3View(navController = navController)
        }
        composable("part4") {
            Part4View(navController = navController)
        }
        composable("part5") {
            Part5View(navController = navController)
        }
        composable("part6") {
            Part6View(navController = navController)
        }
        composable("part7") {
            Part7View(navController = navController)
        }
        composable("part8") {
            Part8View(navController = navController)
        }
        composable("part9") {
            Part9View(navController = navController)
        }
        composable("part10") {
            Part10View(navController = navController)
        }
        composable("part11") {
            Part11View(navController = navController)
        }
        composable("part12") {
            Part12View(navController = navController)
        }
        composable("part13") {
            Part13View(navController = navController)
        }
        composable("part14") {
            Part14View(navController = navController)
        }
        composable("part15") {
            Part15View(navController = navController)
        }
        composable("part16") {
            Part16View(navController = navController)
        }
    }
}