package ru.astrodating.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import androidx.navigation.compose.rememberNavController
import ru.astrodating.screens.part.*
import ru.astrodating.ui.theme.AstrodatingTheme

@Composable
fun QuestionnaireScreen(navController: NavHostController?) {
    var currentPart by remember { mutableStateOf(1) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center
    ) {
        when (currentPart) {
            1 -> Part1View(navController)
            2 -> Part2View(navController)
            3 -> Part3View(navController)
            4 -> Part4View(navController)
            5 -> Part5View(navController)
            6 -> Part6View(navController)
            7 -> Part7View(navController)
            8 -> Part8View(navController)
            9 -> Part9View(navController)
            10 -> Part10View(navController)
            11 -> Part11View(navController)
            12 -> Part12View(navController)
            13 -> Part13View(navController)
            14 -> Part14View(navController)
            15 -> Part15View(navController)
            16 -> Part16View(navController)
        }

        Spacer(modifier = Modifier.height(16.dp))

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            if (currentPart > 1) {
                Button(
                    onClick = { currentPart -= 1 },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Previous")
                }
            }

            if (currentPart < 16) {
                Button(
                    onClick = { currentPart += 1 },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Next")
                }
            } else {
                Button(
                    onClick = {
                        // Handle finish action
                    },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Finish")
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun QuestionnaireScreenPreview() {
    AstrodatingTheme {
        QuestionnaireScreen(navController = rememberNavController())
    }
}
